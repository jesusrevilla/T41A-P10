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

def test_delete_member_from_members_table(db_connection):
    with db_connection.cursor() as cur:
        # Verificar que el miembro 37 existe antes de la eliminación
        cur.execute("SELECT COUNT(*) FROM cd.members WHERE memid = 37")
        member_exists_before = cur.fetchone()[0] > 0
        
        # Verificar si el miembro tiene bookings
        cur.execute("SELECT COUNT(*) FROM cd.bookings WHERE memid = 37")
        has_bookings = cur.fetchone()[0] > 0
        
        # Ejecutar el script de eliminación
        with open("30_Delete_a_member_from_the_cd.members_table.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar el resultado basado en si tenía bookings o no
        cur.execute("SELECT COUNT(*) FROM cd.members WHERE memid = 37")
        member_exists_after = cur.fetchone()[0] > 0
        
        if has_bookings:
            # Si tenía bookings, no debería haber sido eliminado
            assert member_exists_after == True
        else:
            # Si no tenía bookings, debería haber sido eliminado
            assert member_exists_after == False
