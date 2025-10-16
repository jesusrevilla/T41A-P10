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
    """Test que verifica los datos exactos basados en la base de datos real"""
    with db_connection.cursor() as cur:
        with open("14_More_aggregation.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Datos esperados basados en la base de datos real
        expected_results = [
            
            ('Darren', 'Smith', '2012-09-26 18:08:45')
        ]
        
        # Convertir fechas datetime a string para comparación
        converted_results = []
        for row in results:
            converted_row = list(row)
            if hasattr(converted_row[2], 'strftime'):  # Si es datetime
                converted_row[2] = converted_row[2].strftime('%Y-%m-%d %H:%M:%S')
            converted_results.append(tuple(converted_row))
        
        assert converted_results == expected_results
