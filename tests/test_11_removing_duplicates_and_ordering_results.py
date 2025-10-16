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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta con DISTINCT y ORDER BY"""
    with db_connection.cursor() as cur:
        with open("11_Removing_duplicates,_and_ordering_results.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 1 columna (surname)
        for row in results:
            assert len(row) == 1, f"Cada fila debe tener 1 columna, pero se obtuvo {len(row)}"
            
        # Verificar que no hay duplicados (DISTINCT funciona)
        surnames = [row[0] for row in results]
        unique_surnames = list(set(surnames))
        assert len(surnames) == len(unique_surnames), "No debe haber duplicados en los resultados"
        
        # Verificar que los apellidos están ordenados alfabéticamente
        assert surnames == sorted(surnames), "Los apellidos deben estar ordenados alfabéticamente"
        
        # Verificar que todos los apellidos son strings
        for surname in surnames:
            assert isinstance(surname, str), "Cada apellido debe ser un string"
