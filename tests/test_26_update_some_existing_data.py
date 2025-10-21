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

def test_update_data(db_connection):
    with db_connection.cursor() as cur:
        # Ejecutar el script de actualización
        with open("26_Update_some_existing_data.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que el registro se actualizó correctamente
        cur.execute("""
            SELECT initialoutlay
            FROM cd.facilities
            WHERE name = 'Tennis Court 2'
        """)
        result = cur.fetchone()
        
        assert result is not None
        assert result[0] == 10000  # initialoutlay actualizado
