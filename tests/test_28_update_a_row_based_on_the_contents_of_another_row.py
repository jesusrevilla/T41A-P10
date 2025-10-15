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

def test_update_row_based_on_another_row(db_connection):
    with db_connection.cursor() as cur:
        # Obtener los valores originales del facid 0 antes de la actualización
        cur.execute("""
            SELECT membercost, guestcost
            FROM cd.facilities
            WHERE facid = 0
        """)
        original_values = cur.fetchone()
        original_membercost = original_values[0]
        original_guestcost = original_values[1]
        
        # Ejecutar el script de actualización basada en otra fila
        with open("28_Update_a_row based_on_the_contents_of_another_row.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que el facid 1 se actualizó basado en el facid 0
        cur.execute("""
            SELECT membercost, guestcost
            FROM cd.facilities
            WHERE facid = 1
        """)
        result = cur.fetchone()
        
        assert result is not None
        expected_membercost = original_membercost * 1.1
        expected_guestcost = original_guestcost * 1.1
        
        assert abs(result[0] - expected_membercost) < 0.01  # membercost actualizado
        assert abs(result[1] - expected_guestcost) < 0.01  # guestcost actualizado
