import psycopg2
import pytest

# Datos esperados para miembros que han usado canchas de tenis
EXPECTED_RESULTS = [
    ("Anna Mackenzie", "Tennis Court 1"),
    ("Anna Mackenzie", "Tennis Court 2"),
    ("Anne Baker", "Tennis Court 1"),
    ("Anne Baker", "Tennis Court 2"),
    ("Burton Tracy", "Tennis Court 1"),
    ("Burton Tracy", "Tennis Court 2"),
    ("Charles Owen", "Tennis Court 1"),
    ("Charles Owen", "Tennis Court 2"),
    ("Darren Smith", "Tennis Court 1"),
    ("Darren Smith", "Tennis Court 2"),
    ("David Farrell", "Tennis Court 1"),
    ("David Farrell", "Tennis Court 2"),
    ("David Jones", "Tennis Court 1"),
    ("David Jones", "Tennis Court 2"),
    ("Douglas Jones", "Tennis Court 1"),
    ("Douglas Jones", "Tennis Court 2"),
    ("Erica Crumpet", "Tennis Court 1"),
    ("Erica Crumpet", "Tennis Court 2"),
    ("Florence Bader", "Tennis Court 1"),
    ("Florence Bader", "Tennis Court 2"),
    ("Gerald Butters", "Tennis Court 1"),
    ("Gerald Butters", "Tennis Court 2"),
    ("Henrietta Rumney", "Tennis Court 1"),
    ("Henrietta Rumney", "Tennis Court 2"),
    ("Henry Worthington-Smyth", "Tennis Court 1"),
    ("Henry Worthington-Smyth", "Tennis Court 2"),
    ("Hyacinth Tupperware", "Tennis Court 1"),
    ("Hyacinth Tupperware", "Tennis Court 2"),
    ("Jack Smith", "Tennis Court 1"),
    ("Jack Smith", "Tennis Court 2"),
    ("Janice Joplette", "Tennis Court 1"),
    ("Janice Joplette", "Tennis Court 2"),
    ("Jemima Farrell", "Tennis Court 1"),
    ("Jemima Farrell", "Tennis Court 2"),
    ("Joan Coplin", "Tennis Court 1"),
    ("Joan Coplin", "Tennis Court 2"),
    ("John Hunt", "Tennis Court 1"),
    ("John Hunt", "Tennis Court 2"),
    ("Matthew Genting", "Tennis Court 1"),
    ("Matthew Genting", "Tennis Court 2"),
    ("Millicent Purview", "Tennis Court 1"),
    ("Millicent Purview", "Tennis Court 2"),
    ("Nancy Dare", "Tennis Court 1"),
    ("Nancy Dare", "Tennis Court 2"),
    ("Ponder Stibbons", "Tennis Court 1"),
    ("Ponder Stibbons", "Tennis Court 2"),
    ("Ramnaresh Sarwin", "Tennis Court 1"),
    ("Ramnaresh Sarwin", "Tennis Court 2"),
    ("Tim Boothe", "Tennis Court 1"),
    ("Tim Boothe", "Tennis Court 2"),
    ("Timothy Baker", "Tennis Court 1"),
    ("Timothy Baker", "Tennis Court 2"),
    ("Tracy Smith", "Tennis Court 1"),
    ("Tracy Smith", "Tennis Court 2"),
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
        with open("19_Produce_a_list_of_all_members_who_have_used_a_tennis_court.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que tenemos el número correcto de resultados
        assert len(results) == len(EXPECTED_RESULTS)
        
        # Verificar que todos los nombres esperados están en los resultados
        result_names = [(row[0], row[1]) for row in results]
        expected_names = [(row[0], row[1]) for row in EXPECTED_RESULTS]
        
        for expected_name in expected_names:
            assert expected_name in result_names, f"Nombre {expected_name} no encontrado en resultados"
