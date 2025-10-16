import psycopg2
import pytest

# Datos esperados para las reservas de canchas de tenis el 21 de septiembre
EXPECTED_RESULTS = [
    ("2012-09-21 08:00:00", "Tennis Court 1"),
    ("2012-09-21 08:00:00", "Tennis Court 2"),
    ("2012-09-21 09:30:00", "Tennis Court 1"),
    ("2012-09-21 10:00:00", "Tennis Court 2"),
    ("2012-09-21 11:30:00", "Tennis Court 2"),
    ("2012-09-21 12:00:00", "Tennis Court 1"),
    ("2012-09-21 13:30:00", "Tennis Court 1"),
    ("2012-09-21 14:00:00", "Tennis Court 2"),
    ("2012-09-21 15:30:00", "Tennis Court 1"),
    ("2012-09-21 16:00:00", "Tennis Court 2"),
    ("2012-09-21 17:30:00", "Tennis Court 1"),
    ("2012-09-21 18:00:00", "Tennis Court 2"),
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
    """Test que verifica la estructura de la consulta de horarios de canchas de tenis"""
    with db_connection.cursor() as cur:
        with open("16_Work_out_the_start_times_of_bookings_for_tennis_courts.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 2 columnas (starttime, name)
        for row in results:
            assert len(row) == 2, f"Cada fila debe tener 2 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que los horarios son válidos
        for row in results:
            starttime = row[0]
            facility_name = row[1]
            
            assert starttime is not None, "Los horarios no deben ser NULL"
            assert facility_name is not None, "Los nombres de instalaciones no deben ser NULL"
            
            # Verificar que es una cancha de tenis
            assert "Tennis Court" in facility_name, f"Debe ser una cancha de tenis, pero se obtuvo: {facility_name}"
            
            # Verificar formato de fecha
            if hasattr(starttime, 'strftime'):
                assert hasattr(starttime, 'year'), "Debe ser un objeto datetime válido"
            elif isinstance(starttime, str):
                assert len(starttime) >= 10, "Debe ser un string de fecha válido"
