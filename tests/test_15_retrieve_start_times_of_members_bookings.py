import psycopg2
import pytest

# Datos esperados para las reservas de David Farrell
EXPECTED_RESULTS = [
    ("2012-09-18 09:30:00",),
    ("2012-09-18 13:30:00",),
    ("2012-09-18 17:30:00",),
    ("2012-09-19 08:00:00",),
    ("2012-09-19 12:00:00",),
    ("2012-09-19 15:30:00",),
    ("2012-09-20 08:00:00",),
    ("2012-09-20 12:00:00",),
    ("2012-09-20 15:30:00",),
    ("2012-09-21 08:00:00",),
    ("2012-09-21 12:00:00",),
    ("2012-09-21 15:30:00",),
    ("2012-09-22 08:00:00",),
    ("2012-09-22 12:00:00",),
    ("2012-09-22 15:30:00",),
    ("2012-09-23 08:00:00",),
    ("2012-09-23 12:00:00",),
    ("2012-09-23 15:30:00",),
    ("2012-09-24 08:00:00",),
    ("2012-09-24 12:00:00",),
    ("2012-09-24 15:30:00",),
    ("2012-09-25 08:00:00",),
    ("2012-09-25 12:00:00",),
    ("2012-09-25 15:30:00",),
    ("2012-09-26 08:00:00",),
    ("2012-09-26 12:00:00",),
    ("2012-09-26 15:30:00",),
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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta de horarios de reservas"""
    with db_connection.cursor() as cur:
        with open("15_Retrieve the_start_times_of_members'_bookings.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 1 columna (starttime)
        for row in results:
            assert len(row) == 1, f"Cada fila debe tener 1 columna, pero se obtuvo {len(row)}"
            
        # Verificar que los horarios son válidos (datetime o string)
        for row in results:
            starttime = row[0]
            assert starttime is not None, "Los horarios no deben ser NULL"
            
            # Si es datetime, verificar que tiene los atributos correctos
            if hasattr(starttime, 'strftime'):
                assert hasattr(starttime, 'year'), "Debe ser un objeto datetime válido"
                assert hasattr(starttime, 'month'), "Debe ser un objeto datetime válido"
                assert hasattr(starttime, 'day'), "Debe ser un objeto datetime válido"
            # Si es string, verificar que tiene formato de fecha
            elif isinstance(starttime, str):
                assert len(starttime) >= 10, "Debe ser un string de fecha válido"
                assert '-' in starttime or ' ' in starttime, "Debe contener separadores de fecha"
