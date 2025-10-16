import psycopg2
import pytest

# Datos esperados para la consulta con subconsulta
EXPECTED_RESULTS = [
    ("Smith", "Darren", "2012-09-26 18:08:45"),
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
    """Test que verifica la estructura de la consulta de agregación con subconsulta"""
    with db_connection.cursor() as cur:
        with open("14_More_aggregation.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 3 columnas (firstname, surname, joindate)
        for row in results:
            assert len(row) == 3, f"Cada fila debe tener 3 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que todos los datos son del tipo correcto
        for row in results:
            firstname, surname, joindate = row[0], row[1], row[2]
            
            assert isinstance(firstname, str), "El nombre debe ser un string"
            assert isinstance(surname, str), "El apellido debe ser un string"
            assert firstname is not None, "El nombre no debe ser NULL"
            assert surname is not None, "El apellido no debe ser NULL"
            assert joindate is not None, "La fecha de ingreso no debe ser NULL"
            
            # Verificar que la fecha es válida
            if hasattr(joindate, 'strftime'):
                assert hasattr(joindate, 'year'), "Debe ser un objeto datetime válido"
            elif isinstance(joindate, str):
                assert len(joindate) >= 10, "Debe ser un string de fecha válido"
                
        # Verificar que solo hay un resultado (el miembro con la fecha más reciente)
        assert len(results) == 1, f"Debe haber exactamente 1 resultado (el miembro con fecha más reciente), pero se obtuvo {len(results)}"
