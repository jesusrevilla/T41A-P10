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

def test_update_multiple_rows_and_columns(db_connection):
    with db_connection.cursor() as cur:
        # Ejecutar el script de actualización múltiple
        with open("27_Update_multiple_rows_and_columns_at_the_same_time.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que ambos Tennis Courts se actualizaron correctamente
        cur.execute("""
            SELECT name, membercost, guestcost
            FROM cd.facilities
            WHERE name LIKE 'Tennis Court%'
            ORDER BY name
        """)
        results = cur.fetchall()
        
        assert len(results) == 2
        
        # Verificar Tennis Court 1
        tennis_court_1 = results[0]
        assert tennis_court_1[0] == 'Tennis Court 1'
        assert tennis_court_1[1] == 6  # membercost actualizado
        assert tennis_court_1[2] == 30  # guestcost actualizado
        
        # Verificar Tennis Court 2
        tennis_court_2 = results[1]
        assert tennis_court_2[0] == 'Tennis Court 2'
        assert tennis_court_2[1] == 6  # membercost actualizado
        assert tennis_court_2[2] == 30  # guestcost actualizado
