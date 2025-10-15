import psycopg2
import pytest

# Datos esperados para la consulta SELECT name, membercost FROM cd.facilities
EXPECTED_RESULTS = [
    ("Tennis Court 1", 5),
    ("Tennis Court 2", 5),
    ("Badminton Court", 0),
    ("Table Tennis", 0),
    ("Massage Room 1", 35),
    ("Massage Room 2", 35),
    ("Squash Court", 3.5),
    ("Snooker Table", 0),
    ("Pool Table", 0),
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
        with open("04_Retrieve_specific_columns_from_a_table.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
