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

def test_insert_multiple_data(db_connection):
    with db_connection.cursor() as cur:
        # Ejecutar el script de inserción múltiple
        with open("24_Insert multiple_rows_of_data_into_a_table.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que ambos registros se insertaron correctamente
        cur.execute("""
            SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
            FROM cd.facilities
            WHERE facid IN (9, 10)
            ORDER BY facid
        """)
        results = cur.fetchall()
        
        assert len(results) == 2
        
        # Verificar el primer registro (Spa)
        spa_record = results[0]
        assert spa_record[0] == 9  # facid
        assert spa_record[1] == 'Spa'  # name
        assert spa_record[2] == 20  # membercost
        assert spa_record[3] == 30  # guestcost
        assert spa_record[4] == 100000  # initialoutlay
        assert spa_record[5] == 800  # monthlymaintenance
        
        # Verificar el segundo registro (Squash Court 2)
        squash_record = results[1]
        assert squash_record[0] == 10  # facid
        assert squash_record[1] == 'Squash Court 2'  # name
        assert squash_record[2] == 3.5  # membercost
        assert squash_record[3] == 17.5  # guestcost
        assert squash_record[4] == 5000  # initialoutlay
        assert squash_record[5] == 80  # monthlymaintenance
