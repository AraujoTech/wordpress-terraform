import argparse
import psycopg2
from psycopg2 import sql
import sys
def create_connection(db_params):
    try:
        connection = psycopg2.connect(**db_params)
        return connection
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        sys.exit(1)

def insert_data_into_wordpress(connection):
    cursor = connection.cursor()

    try:
        insert_data_query = '''
            INSERT INTO wp_posts (post_title, post_content, post_type, post_status)
            VALUES (%s, %s, %s, %s);
        '''
        data = [('Sample Post 1', 'This is the content of post 1.', 'post', 'publish'),
                ('Sample Post 2', 'This is the content of post 2.', 'post', 'publish'),
                ('Sample Page 1', 'This is the content of page 1.', 'page', 'publish')]

        cursor.executemany(insert_data_query, data)
        connection.commit()
        print("Data inserted into WordPress database successfully!")

    except Exception as e:
        print(f"Error: {e}")
        connection.rollback()

    finally:
        cursor.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Load data into WordPress database')
    parser.add_argument('--host', help='PostgreSQL host)', default="postgresql-svc.databases" )
    parser.add_argument('-db','--database', help='PostgreSQL database name',default="wordpress")
    parser.add_argument('-u','--user', help='PostgreSQL username', default="wordpress")
    parser.add_argument('-p','--password', help='PostgreSQL password')

    args = parser.parse_args()

    db_params = {
        'host': args.host,
        'database': args.database,
        'user': args.user,
        'password': args.password,
    }

    connection = create_connection(db_params)
    insert_data_into_wordpress(connection)
    connection.close()
