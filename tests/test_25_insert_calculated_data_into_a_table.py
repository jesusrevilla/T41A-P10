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

def test_insert_calculated_data(db_connection):
    with db_connection.cursor() as cur:
        # Obtener el facid máximo actual antes de la inserción
        cur.execute("SELECT MAX(facid) FROM cd.facilities")
        max_facid_before = cur.fetchone()[0]
        
        # Ejecutar el script de inserción con datos calculados
        with open("25_Insert_calculated_data_into_a_table.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que el registro se insertó con el facid correcto
        expected_facid = max_facid_before + 1
        cur.execute("""
            SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
            FROM cd.facilities
            WHERE facid = %s
        """, (expected_facid,))
        result = cur.fetchone()
        
        assert result is not None
        assert result[0] == expected_facid  # facid calculado
        assert result[1] == 'Spa'  # name
        assert result[2] == 20  # membercost
        assert result[3] == 30  # guestcost
        assert result[4] == 100000  # initialoutlay
        assert result[5] == 800  # monthlymaintenance
