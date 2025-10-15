import psycopg2
import pytest

# Datos esperados para la consulta con UNION
EXPECTED_RESULTS = [
    ("Badminton Court",),
    ("Bader",),
    ("Baker",),
    ("Boothe",),
    ("Butters",),
    ("Coplin",),
    ("Crumpet",),
    ("Dare",),
    ("Farrell",),
    ("Genting",),
    ("Hunt",),
    ("Jones",),
    ("Joplette",),
    ("Mackenzie",),
    ("Owen",),
    ("Pinker",),
    ("Purview",),
    ("Rumney",),
    ("Sarwin",),
    ("Smith",),
    ("Snooker Table",),
    ("Squash Court",),
    ("Stibbons",),
    ("Table Tennis",),
    ("Tennis Court 1",),
    ("Tennis Court 2",),
    ("Tracy",),
    ("Tupperware",),
    ("Worthington-Smyth",),
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
        with open("12_Combining_results_from_multiple_queries.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
