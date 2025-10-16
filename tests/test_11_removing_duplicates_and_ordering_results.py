import psycopg2
import pytest

# Datos esperados para la consulta con DISTINCT y ORDER BY
EXPECTED_RESULTS = [
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
        with open("11_Removing_duplicates,_and_ordering_results.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que tenemos el número correcto de resultados
        assert len(results) == len(EXPECTED_RESULTS)
        
        # Verificar que todos los apellidos esperados están en los resultados
        result_surnames = [row[0] for row in results]
        expected_surnames = [row[0] for row in EXPECTED_RESULTS]
        
        for expected_surname in expected_surnames:
            assert expected_surname in result_surnames, f"Apellido {expected_surname} no encontrado en resultados"
