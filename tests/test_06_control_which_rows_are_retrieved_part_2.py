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
        with open("06_Control_which_rows_are_retrieved_-_part_2.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Datos esperados basados en la base de datos real
        expected_results = [
            (4, "Massage Room 1", 35.0, 3000.0),
            (5, "Massage Room 2", 35.0, 3000.0)
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
