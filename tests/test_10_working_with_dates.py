import psycopg2
import pytest

# Datos esperados para la consulta con fechas
EXPECTED_RESULTS = [
    (15, "Bader", "Florence", "2012-09-08 09:30:00"),
    (16, "Baker", "Anne", "2012-09-10 14:30:00"),
    (17, "Boothe", "Timothy", "2012-09-15 10:30:00"),
    (20, "Stibbons", "Ponder", "2012-09-17 11:30:00"),
    (21, "Tracy", "Burton", "2012-09-18 09:30:00"),
    (22, "Dare", "Nancy", "2012-09-20 16:30:00"),
    (24, "Sarwin", "Ramnaresh", "2012-09-28 16:00:00"),
    (26, "Jones", "Douglas", "2012-10-02 18:30:00"),
    (27, "Rumney", "Henrietta", "2012-10-05 16:30:00"),
    (28, "Farrell", "David", "2012-10-08 14:00:00"),
    (29, "Worthington-Smyth", "Henry", "2012-10-12 11:30:00"),
    (30, "Purview", "Millicent", "2012-10-18 19:30:00"),
    (33, "Tupperware", "Hyacinth", "2012-10-18 19:30:00"),
    (35, "Hunt", "John", "2012-10-19 14:30:00"),
    (36, "Crumpet", "Erica", "2012-10-22 16:00:00"),
    (37, "Smith", "Darren", "2012-10-22 13:00:00"),
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
        with open("10_Working_with_dates.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Convertir fechas datetime a string para comparación
        converted_results = []
        for row in results:
            converted_row = list(row)
            if hasattr(converted_row[3], 'strftime'):  # Si es datetime
                converted_row[3] = converted_row[3].strftime('%Y-%m-%d %H:%M:%S')
            converted_results.append(tuple(converted_row))
        
        assert converted_results == EXPECTED_RESULTS
