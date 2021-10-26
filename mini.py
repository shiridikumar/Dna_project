import subprocess as sp
import pymysql
import pymysql.cursors
import datetime
from datetime import date



operations=["invalid()","Add_details()","delivery_status()","Update_delivery()","Customer_details()","previous_purchases()","update_stock()","update_price()","Add_review()","cancel_order()","view_details()","view_by_manufacturer()","toc()","top()","search_product()","sort_view()","analyse()"]


def calculateAge(birthDate):
    today = date.today()
    age = today.year - birthDate.year - ((today.month, today.day) < (birthDate.month, birthDate.day))
    return age
     

def getage(cid):
    query="select date,month,year from Customers where customer_id={}".format(cid)
    cur.execute(query)
    oup=cur.fetchall()[0]
    ans=calculateAge(date(oup["year"], oup["month"], oup["date"]))
    return ans
    

def analyse():
    query="select * from product_purchased"
    cur.execute(query)
    teens={"mobiles":0,"laptops":0,"fashion":0,"other than mobiles/laptops/fashion":0}
    midage={"mobiles":0,"laptops":0,"fashion":0,"other than mobiles/laptops/fashion":0}
    oldage={"mobiles":0,"laptops":0,"fashion":0,"other than mobiles/laptops/fashion":0}
    oup=cur.fetchall()
    for i in oup:
        cid=i["customer_id"]
        pid=i["product_id"]
        query2="select * from mobiles where product_id={}".format(pid)
        query3="select * from laptops where product_id ={}".format(pid)
        query4="select * from fashion where product_id={}".format(pid)
        cur.execute(query2)
        oup=cur.fetchall()
        ptype="other than mobiles/laptops/fashion"
        if(len(oup)>0):
            ptype="mobiles"
        else:
            cur.execute(query3)
            oup=cur.fetchall()
            if(len(oup)>0):
                ptype="laptops"
            else:
                cur.execute(query4)
                oup=cur.fetchall()
                if(len(oup)>0):
                    ptype="fashion"
                else:
                    ptype="other than mobiles/laptops/fashion"
        #print("**************")
        ans=getage(cid)
        if(ans<=19):
            teens[ptype]+=1
        elif(ans>19 and ans <25):
            midage[ptype]+=1
        else:
            oldage[ptype]+=1
 
    max_teens=max(teens,key=teens.get)
    print()
    print("Analysis from the purchase data")
    print("_"*80)
    print("Teenagers are interested in :  ",max_teens)
    print("_"*80)

    max_mid=max(midage,key=midage.get)
    print("middle age are interested in :  ",max_mid)
    print("_"*80)

    max_old=max(oldage,key=oldage.get)
    print("oldage are interested in : ",max_old)
    print("_"*80)

    con.commit()

def search_product():
    print()
    try:
        print("1. Start substring , 2. End substring")
        inp=int(input("Enter your search type from above options (1/2) : "))
        if(inp==1):
            pattern=input("Enter your starting substring of the product name: ")
            query="select * from products where product_name like '{}%'".format(pattern)
            cur.execute(query)
            oup=cur.fetchall()
            print("Available products")
            print("-"*45)
            for i in oup:
                print(i["product_name"]," : ",i["product_id"])
                print("-"*45)
        elif(inp==2):
            pattern=input("Enter your ending substring of the product name: ")
            query="select * from products where product_name like '%{}'".format(pattern)
            cur.execute(query)
            oup=cur.fetchall()
            print("Available products")
            print("-"*60)
            for i in oup:
                print("product name :",i["product_name"],"\n","product id :",i["product_id"])
                print("-"*60)
        else:
            print("Invalid input")
    except:
        print("Invalid input")
    else:
        con.commit()


def view_details():
    print()
    try:
        pid=int(input("Enter the product id : "))
        print("product details")
        print("_"*50)
        query1="select * from products where product_id={}".format(pid)
        cur.execute(query1)
        oup=cur.fetchall()
        if(len(oup)>0):
            for i in oup[0]:
                print(i,":",oup[0][i])

        query2="select * from mobiles where product_id={}".format(pid)
        cur.execute(query2)
        oup=cur.fetchall()
        if(len(oup)>0):
            print("Category : mobiles")
            for i in oup[0]:
                print(i,":",oup[0][i])

        query3="select * from laptops where product_id={}".format(pid)
        cur.execute(query3)
        oup=cur.fetchall()
        if(len(oup)>0):
            print("Category : laptops")
            for i in oup[0]:
                print(i,":",oup[0][i])

        query4="select * from fashion where product_id={}".format(pid)
        cur.execute(query4)
        oup=cur.fetchall()
        if(len(oup)>0):
            print("Category : fashion")
            for i in oup[0]:
                print(i,":",oup[0][i])
        print("_"*50)
    except Exception as e:
        print(e)
        print("please give valid inputs following the Integrity constraints ")



    con.commit()

def  sort_view():
    query="select * from products order by overall_rating DESC"
    cur.execute(query)
    oup=cur.fetchall()
    print("Available products")
    print("-"*100)
    for i in oup:
        print("product name :",i["product_name"],"\n","product id :",i["product_id"],"\n","product rating :",i["overall_rating"])
        print("-"*100)
    con.commit()



def Add_review():
    try:
        cid=int(input("Enter customer id of the reviewer : "))
        pid=int(input("Enter the product id of the reviewed product:"))
        #review="Wow this is such an amazing product"
        review=input("Enter the review of the customer\n")
        rating=float(input("Enter rating of the review : "))

        query1="insert into product_reviews(product_id,customer_id,review,rating) values({},{},'{}',{})".format(pid,cid,review,rating)
        cur.execute(query1)

        query2="select avg(rating) as avg ,count(*) as num from product_reviews where product_id={}".format(pid)
        cur.execute(query2)

        op=cur.fetchall()[0]
        ag=op["avg"]
        num=op["num"]

        query3="update products set overall_reviews={},overall_rating={} where product_id={}".format(num,ag,pid)
        cur.execute(query3)
    except Exception as e:
        print(e)
        print("Please give valid inputs following integrity constraints")

    else:
        con.commit()

def toc():
    print()
    cid=int(input("Enter Customer id: "))
    query="select count(*) as total from customer_purchases where customer_id={}".format(cid)
    cur.execute(query)
    oup=cur.fetchall()
    print("Total purchases of customer: ",oup[0]["total"])
    query1="select count(*) as total from product_purchased where customer_id={}".format(cid)
    cur.execute(query1)
    oup=cur.fetchall()
    print("Total products bought by the customer : ",oup[0]["total"])

    con.commit()

def top():
    print()
    cid=int(input("Enter Product id: "))
    query="select count(*) as total from product_purchased where product_id={}".format(cid)
    cur.execute(query)
    oup=cur.fetchall()
    print("Total sales of the product: ",oup[0]["total"])
    con.commit()
    
def view_by_manufacturer():
    try:
        print()
        query="select distinct(manufacturer) as man from products"
        cur.execute(query)
        oup=cur.fetchall()
        ind=1
        print("Available manufacturers of products")
        for i in oup:
            print(ind,":",i["man"])
            ind+=1
        
        inp=int(input("Enter the number to select the manufacturer : "))
        query1="select product_name,product_id from products where manufacturer='{}'".format(oup[inp-1]["man"])
        cur.execute(query1)
        oup=cur.fetchall()
        print("Available products")
        print("-"*60)
        for i in oup:
            print("product name :",i["product_name"],"\n","Product id :",i["product_id"])
            print("-"*60)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()
           
def Customer_details():
    print()
    try:
        cid=int(input("Enter Customer id to update : "))
        cname=input("Enter Updated Customer name (should be <30 characters): ")
        phn=int(input("Add a new phone no : "))
        print("Enter new Date of Birth")
        year=input("Enter Year : ")
        month=input("Enter month : ")
        date=input("Enter date : ")
        print()
        query1="update customers set name='{}',year={},month={},date={} where customer_id={};".format(cname,year,month,date,cid)
        cur.execute(query1)
        query2="insert into customer_phone_no(customer_id,phone_no) values({},{})".format(cid,phn)
        cur.execute(query2)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()

def previous_purchases():
    try:
        cid=int(input("Enter the customer id to view the purchase history : "))
        query1="select * from product_purchased  where customer_id={} order by Timestamp DESC".format(cid)
        cur.execute(query1)
        oup=cur.fetchall()
        print("-"*48)
        query2="select name from customers where customer_id={}".format(cid)
        cur.execute(query2)
        name=cur.fetchall()[0]["name"]
        print("Customer name :",name)
        print("-"*45)
        for i in oup:
            query3="select product_name,price from products where product_id={}".format(i["product_id"])
            cur.execute(query3)
            poup=cur.fetchall()
            for j in poup:
                print("Timestamp : "," : ",i["Timestamp"]),
                print("product name : ",":",j["product_name"])
                print("Product id : "," : ",i["product_id"])
                print("product price: "," : ", j["price"])
                print("-"*45)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()



def update_stock():
    print()
    try:
        pid=int(input("Enter product id for updating stock : "))
        new_stock=int(input("Enter new stock amount : "))
        query1="update products set stock={} where product_id={}".format(new_stock,pid)
        cur.execute(query1)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()

def update_price():
    print()
    try:
        pid=int(input("Enter product id for updating price : "))
        price=int(input("Enter new price : "))
        query1="update products set price={} where product_id={}".format(price,pid)
        cur.execute(query1)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()



def invalid():
    print("Invlaid input...try again")


def Update_delivery():
    print()
    try:
        pay_id=input("Enter payment_id to update the status : ")
        print()
        a={1:"dispatched",2:"not yet dispatched",3:"shipped",4:"packed",5:"out for delivery"}
        print(a)
        flag=1
        while(flag==1):
            status=int(input("Enter 1/2/3/4/5 to update the status : "))
            if(status<=5 and status>=1):
                break
            else:
                print("Invalid status number:please try again")
        query1="update delivery set delivery_status='{}' where payment_id={}".format(a[status],pay_id)
        cur.execute(query1)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()

def cancel_order():
    try:
        pay_id=int(input("Enter the payment id : ")) 
        orders="select * from orders where payment_id={}".format(pay_id)
        cur.execute(orders)
        ord=cur.fetchall()
        query1="delete from payment where payment_id={}".format(pay_id)
        cur.execute(query1)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()


def delivery_status():
    print()
    try:
        pid=int(input("Enter payment id : "))
        query1="select * from delivery where payment_id={}".format(pid)
        cur.execute(query1)
        status=cur.fetchall()[0]
        print()
        print(status)
        print("-"*20,"status","-"*20)
        print("Customer id: {}".format(status["customer_id"]))
        print("Expected delivery: {}".format(status["expected_delivery"]))
        print("Status: {}".format(status["delivery_status"]))
        print("-"*48)
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()

def Add_details():
    print()
    try:
        ct=datetime.datetime.now()
        cid=int(input("Enter the customer id : "))
        pay="select max(payment_id) as max from payment"
        cur.execute(pay)
        pay_id=cur.fetchall()[0]["max"]+1
        nop=int(input("Enter the number of purchased products : "))
        print()
        products_purchased=[]
        price=0
        for i in range(nop):
            pid=int(input("Enter the product id of product {} : ".format(i+1)))
            products_purchased.append(pid)
            pricequery="select price from products where product_id={};".format(pid)
            cur.execute(pricequery)
            price+=cur.fetchall()[0]["price"]
        print("---------------------------")
        print("total bill amaount",price)
        print("---------------------------")
        print()
        method_flag=1
        while(method_flag==1):
            payment_method=input("Enter payment method(U/COD/CARD) (U:UPI ,COD:cash on delivery,C:debit card) : ")
            payment_method.lower()
            if(payment_method!="u" and payment_method!="cod" and payment_method!="card"):
                print("Invalid payment method ... enter again")
                method_flag=1
            else:
                method_flag=0
                break
        discount=float(input("Enter discount for the purchase : "))
        door_no=input("Enter door no/colony of the delivery address : ")
        street=input("Enter stree/area name of the delivery address : ")
        district=input("Enter district name of the delivery address : ")
        pincode=int(input("Enter pincode of the delivery adress : "))
        method={"u":"UPI","cod":"cash on delivery","card":"Debit card"}
        query1="insert into Customer_purchases(Customer_id,Timestamp) values({},'{}');".format(cid,ct)
        cur.execute(query1)

        for i in range(len(products_purchased)):
            query2="insert into product_purchased(Customer_id,product_id,Timestamp) values({},{},'{}');".format(cid,products_purchased[i],ct)
            cur.execute(query2)
        
        query4="insert into payment(payment_id,payment_method,price,discount)  values({},'{}',{},{});".format(pay_id,method[payment_method],price,discount)
        cur.execute(query4)

        query3="insert into delivery(payment_id,customer_id,Delivery_status,door_no,street,pincode) values({},{},'{}','{}','{}',{});".format(pay_id,cid,"recieved order",door_no,street,pincode)
        cur.execute(query3)

        for i in range(len(products_purchased)):
            query5="insert into orders(Customer_id,Product_id,Payment_id) values({},{},{})".format(cid,pid,pay_id)
            cur.execute(query5)

        query6="insert into final_price(price,discount,final_price)  select * from  (select {} ,{}, {}) as tmp  where not exists(select * from final_price where price={} and discount={}) limit 1;".format(price,discount,price-(discount/price)*100,price,discount)
        cur.execute(query6)

        query7="insert into district(pincode,district)  select * from  (select {} ,'{}') as tmp  where not exists(select * from district where pincode={}) limit 1;".format(pincode,district,pincode)
        cur.execute(query7)

        print("executing....")
        print("succesfully executed") 
        print()
    except Exception as e:
        print(e)
        print("Please give valid inputs ensuring the constraints")

    else:
        con.commit()


flag=1
while(flag==1):
    #tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user=username,
                              password=password,
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
                print("1. Add details of a purchase")  
                print("2. Check Delivery status") 
                print("3. Update Delivery status for a Delivery")  
                print("4. Update Customer details") 
                print("5. See customer previous purchases")  
                print("6. Update stock details of a product")
                print("7. Update price of a product")
                print("8. Add review of a customer")
                print("9. Cancel an order")
                print("10. View product details of a product id")
                print("11. View products by Manufacturer")
                print("12. View total purchases of a customer")
                print("13. View Total sales of a product")
                print("14. search product names with starting/ending strings")
                print("15. sort products on rating and view")
                print("16. Analyse Age group Vs their purchases")
                print("17. Exit")


                ch = int(input("Enter choice> "))
                #tmp = sp.call('clear', shell=True)
                if ch ==17:
                    flag=0
                    print("Thank you!!!")
                    break
                else:
                    eval(operations[ch])
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:

        #tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
