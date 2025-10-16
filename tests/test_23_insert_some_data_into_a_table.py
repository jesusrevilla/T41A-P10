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

def test_insert_data(db_connection):
    with db_connection.cursor() as cur:
        # Ejecutar el script de inserción
        with open("23_Insert_some_data_into_a_table.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que el registro se insertó correctamente
        cur.execute("""
            SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
            FROM cd.facilities
            WHERE facid = 9
        """)
        result = cur.fetchone()
        
        assert result is not None
        assert result[0] == 9  # facid
        assert result[1] == 'Spa'  # name
        assert result[2] == 20  # membercost
        assert result[3] == 30  # guestcost
        assert result[4] == 100000  # initialoutlay
        assert result[5] == 800  # monthlymaintenance
