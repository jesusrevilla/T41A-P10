import psycopg2
import pytest

# Datos esperados para la consulta con subconsulta
EXPECTED_RESULTS = [
    ("Smith", "Darren", "2012-09-26 18:08:45"),
]

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
    with db_connection.cursor() as cur:
        with open("14_More_aggregation.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
