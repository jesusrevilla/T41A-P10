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
        
        # Verificar que tenemos el número correcto de resultados
        assert len(results) == len(EXPECTED_RESULTS)
        
        # Verificar que todos los nombres esperados están en los resultados
        result_names = [row[0] for row in results]
        expected_names = [row[0] for row in EXPECTED_RESULTS]
        
        for expected_name in expected_names:
            assert expected_name in result_names, f"Nombre {expected_name} no encontrado en resultados"
