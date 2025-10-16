import psycopg2
import pytest

# Datos esperados para la consulta con fechas
EXPECTED_RESULTS = [
    (15, "Bader", "Florence", "2012-09-08 09:30:00"),
    (16, "Baker", "Anne", "2012-09-10 14:30:00"),
    (17, "Boothe", "Timothy", "2012-09-15 10:30:00"),
    (20, "Stibbons", "Ponder", "2012-09-17 11:30:00"),
    (21, "Tracy", "Burton", "2012-09-18 09:30:00"),
    (22, "Dare", "Nancy", "2012-09-20 16:30:00"),
    (24, "Sarwin", "Ramnaresh", "2012-09-28 16:00:00"),
    (26, "Jones", "Douglas", "2012-10-02 18:30:00"),
    (27, "Rumney", "Henrietta", "2012-10-05 16:30:00"),
    (28, "Farrell", "David", "2012-10-08 14:00:00"),
    (29, "Worthington-Smyth", "Henry", "2012-10-12 11:30:00"),
    (30, "Purview", "Millicent", "2012-10-18 19:30:00"),
    (33, "Tupperware", "Hyacinth", "2012-10-18 19:30:00"),
    (35, "Hunt", "John", "2012-10-19 14:30:00"),
    (36, "Crumpet", "Erica", "2012-10-22 16:00:00"),
    (37, "Smith", "Darren", "2012-10-22 13:00:00"),
]

@pytest.fixture(scope="module")
def db_connection():
    conn = psycopg2.connect(
        dbname="exercises",
        user="postgres",
        password="postgres",
        host="localhost"
    )
    yield conn
    conn.close()

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta con fechas"""
    with db_connection.cursor() as cur:
        with open("10_Working_with_dates.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 4 columnas (memid, surname, firstname, joindate)
        for row in results:
            assert len(row) == 4, f"Cada fila debe tener 4 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que todos los datos son del tipo correcto
        for row in results:
            memid, surname, firstname, joindate = row[0], row[1], row[2], row[3]
            
            assert isinstance(memid, int), "memid debe ser un entero"
            assert isinstance(surname, str), "El apellido debe ser un string"
            assert isinstance(firstname, str), "El nombre debe ser un string"
            assert surname is not None, "El apellido no debe ser NULL"
            assert firstname is not None, "El nombre no debe ser NULL"
            assert joindate is not None, "La fecha de ingreso no debe ser NULL"
            
            # Verificar que la fecha es válida y es >= 2012-09-01
            if hasattr(joindate, 'strftime'):
                assert joindate.year >= 2012, "La fecha debe ser de 2012 o posterior"
                if joindate.year == 2012:
                    assert joindate.month >= 9, "Si es 2012, debe ser septiembre o posterior"
            elif isinstance(joindate, str):
                assert '2012-09' in joindate or '2012-10' in joindate or '2012-11' in joindate or '2012-12' in joindate, "La fecha debe ser de septiembre 2012 o posterior"
                
        # Verificar que las fechas están ordenadas (ORDER BY joindate)
        dates = [row[3] for row in results]
        if all(hasattr(d, 'strftime') for d in dates):
            # Si son objetos datetime, verificar orden
            sorted_dates = sorted(dates)
            assert dates == sorted_dates, "Las fechas deben estar ordenadas"
        elif all(isinstance(d, str) for d in dates):
            # Si son strings, verificar orden
            sorted_dates = sorted(dates)
            assert dates == sorted_dates, "Las fechas deben estar ordenadas"
