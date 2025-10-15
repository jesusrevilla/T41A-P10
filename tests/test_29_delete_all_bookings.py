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

def test_delete_all_bookings(db_connection):
    with db_connection.cursor() as cur:
        # Verificar que hay bookings antes de la eliminación
        cur.execute("SELECT COUNT(*) FROM cd.bookings")
        bookings_before = cur.fetchone()[0]
        assert bookings_before > 0
        
        # Ejecutar el script de eliminación
        with open("29_Delete_all_bookings.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que todos los bookings fueron eliminados
        cur.execute("SELECT COUNT(*) FROM cd.bookings")
        bookings_after = cur.fetchone()[0]
        assert bookings_after == 0
