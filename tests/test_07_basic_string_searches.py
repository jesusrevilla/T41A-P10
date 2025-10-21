import psycopg2
import pytest

# Datos esperados para la consulta con LIKE '%Tennis%'
EXPECTED_RESULTS = [
    (0, "Tennis Court 1", 5, 25, 10000, 200),
    (1, "Tennis Court 2", 5, 25, 8000, 200),
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
    """Test que verifica los datos exactos basados en la base de datos real"""
    with db_connection.cursor() as cur:
        with open("07_Basic_string_searches.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Datos esperados basados en la base de datos real
        expected_results = [
            (0, "Tennis Court 1", 5.0, 25.0, 10000.0, 200.0),
            (1, "Tennis Court 2", 5.0, 25.0, 8000.0, 200.0),
            (3, "Table Tennis", 0.0, 5.0, 320.0, 10.0)
        ]
        
        # Convertir Decimal a float para comparación
        converted_results = []
        for row in results:
            converted_row = []
            for item in row:
                if hasattr(item, 'as_tuple'):  # Si es Decimal
                    converted_row.append(float(item))
                else:
                    converted_row.append(item)
            converted_results.append(tuple(converted_row))
        
        assert converted_results == expected_results
