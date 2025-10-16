import psycopg2
import pytest

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
    """Test que verifica la estructura de la consulta sin depender de datos exactos"""
    with db_connection.cursor() as cur:
        with open("06_Control_which_rows_are_retrieved_-_part_2.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 4 columnas (facid, name, membercost, monthlymaintenance)
        for row in results:
            assert len(row) == 4, f"Cada fila debe tener 4 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que los costos son numéricos y cumplen la condición
        for row in results:
            facid, name, membercost, monthlymaintenance = row[0], row[1], row[2], row[3]
            
            # Convertir a float si es Decimal
            if hasattr(membercost, 'as_tuple'):
                membercost_val = float(membercost)
            else:
                membercost_val = float(membercost)
                
            if hasattr(monthlymaintenance, 'as_tuple'):
                monthlymaintenance_val = float(monthlymaintenance)
            else:
                monthlymaintenance_val = float(monthlymaintenance)
            
            # Verificar la condición de la consulta: membercost > 0 AND membercost < monthlymaintenance / 50.0
            assert membercost_val > 0, f"membercost debe ser mayor a 0, pero se obtuvo: {membercost_val}"
            assert membercost_val < monthlymaintenance_val / 50.0, f"membercost debe ser menor que monthlymaintenance/50, pero se obtuvo: {membercost_val} >= {monthlymaintenance_val/50.0}"
