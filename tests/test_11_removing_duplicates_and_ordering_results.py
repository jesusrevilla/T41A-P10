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

def test_query_data(db_connection):
    """Test que verifica los datos exactos basados en la base de datos real"""
    with db_connection.cursor() as cur:
        with open("11_Removing_duplicates,_and_ordering_results.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Datos esperados basados en la base de datos real
        expected_results = [
            ("Bader",),
            ("Baker",),
            ("Boothe",),
            ("Butters",),
            ("Coplin",),
            ("Crumpet",),
            ("Dare",),
            ("Farrell",),
            ("GUEST",),
            ("Genting",)
        ]
        
        assert results == expected_results
