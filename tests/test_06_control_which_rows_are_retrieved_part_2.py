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
        
        # Verificar que cada fila tiene 4 columnas (facid, name, membercost, guestcost)
        for row in results:
            assert len(row) == 4, f"Cada fila debe tener 4 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que los nombres contienen "Tennis Court"
        tennis_courts = [row[1] for row in results if "Tennis Court" in row[1]]
        assert len(tennis_courts) > 0, "Debe haber al menos una cancha de tenis en los resultados"
        
        # Verificar que los costos son numéricos
        for row in results:
            assert isinstance(row[2], (int, float)) or hasattr(row[2], 'as_tuple'), "membercost debe ser numérico"
            assert isinstance(row[3], (int, float)) or hasattr(row[3], 'as_tuple'), "guestcost debe ser numérico"
