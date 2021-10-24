import subprocess as sp
import pymysql
import pymysql.cursors



operations=["invalid()","Add_details()","delivery_status()","Customer_details()"]



def first():
    print("first option called")

    
def second():
    print("second option called")
while(1):
    #tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='127.0.0.1',
                              port=3306,
                              user="root",
                              password="2002",
                              db='amazing',
                              cursorclass=pymysql.cursors.DictCursor)
        #tmp = sp.call('clear', shell=True)
        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        with con.cursor() as cur:
            while(1):
                #tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Add details of a purchase")  # Hire an Employee
                print("2. Update Delivery status for a Delivery")  # Fire an Employee
                print("3. Update Customer details")  # Promote Employee
                print("4. See customer previous purchases")  # Employee Statistics
                print("5. Update stock details of a product")
                print("6. Update price of a product")
                print("7. Add review of a customer")
                print("8. Cancel an order")
                print("9. Enter 9 to view retrieval operations")

                ch = int(input("Enter choice> "))
                eval(a[ch])
                #tmp = sp.call('clear', shell=True)
                if ch ==5:
                    k=1
                else:
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        #tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
