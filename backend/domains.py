import sys
import graphene
import mysql.connector as mysql
class Domain(graphene.ObjectType):
    dname=graphene.String()
    ftname=graphene.String()

class Propertyoption(graphene.ObjectType):
    allowedvalue=graphene.String()
    allowedvalueCode=graphene.String()

class Property(graphene.ObjectType):
    domname=graphene.String()
    propertyname=graphene.String()
    propertyquestion=graphene.String()
    displayorder=graphene.String()
    propertydisplaytype=graphene.String()
    propertoptions=graphene.List(Propertyoption)

class Output(graphene.ObjectType):
    id=graphene.String()
    heading=graphene.String()
    name=graphene.String()
    url=graphene.String()

class User(graphene.ObjectType):
    userid=graphene.String()
    domname=graphene.String()
    bname=graphene.String()
    bookmark=graphene.String()

class CreateBookmark(graphene.Mutation):
    # define output of mutation here
    ok = graphene.Boolean()
    userid = graphene.String()
    dname=graphene.String()
    bname = graphene.String()
    bookmark=graphene.String()
    # define data to be sent to server as part of insert
    class Arguments:
        
        userid = graphene.String()
        dname=graphene.String()
        bname = graphene.String()
        bookmark=graphene.String()
    # code to modify database
    def mutate(self, info, userid, dname, bname, bookmark):
        db = mysql.connect(
            host="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        print(userid,bname)
        sql = "insert into userbookmark values ('"+userid+"','"+dname+"','"+bname+"','"+bookmark+"')"
        print(sql)
        cursor = db.cursor()
        try:
            cursor.execute(sql)
            db.commit()
            cursor.close()
            db.close()
            return CreateBookmark(ok=True,userid=userid,bname=bname)
        except Exception as e:
            db.rollback()
            cursor.close()
            db.close()
            return CreateBookmark(ok=False,userid="",bname="")

class Queries(graphene.ObjectType):
    domains=graphene.List(Domain)
    properties=graphene.List(Property,domain=graphene.String())
    output=graphene.List(Output,domainname=graphene.String(),str=graphene.String())
    user=graphene.List(User, user=graphene.String())
    

    def resolve_user(self,info,user):
        db = mysql.connect(
            host="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        query1="select * from userbookmark where userid='"+user+"'" 
        cursor = db.cursor()
        cursor.execute(query1)
        records = cursor.fetchall()
        print(records)
        cursor.close()
        db.close()
        users = []
        str="(  "
        for record in records:
            #print(record[3])
            temp=record[3].replace(',','=')
            li=temp.split('=')
            str="( "
            str+=li[0]
            str+=" = "
            str+=li[1]
            
            for ind in range(2,len(li),2):
                if(li[ind]==li[ind-2]):
                    str=str+" or "+li[ind]+" = "+li[ind+1]
                else:
                    str=str+" ) and ( "+li[ind]+" = "+li[ind+1]
            str+=" )"    
            
            users.append(User(userid=record[0],domname=record[1],bname=record[2],bookmark=str))
        #print(users)
        return users
        

    
    def resolve_output(self, info, domainname, str):
        db = mysql.connect(
            host ="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        query1="select factTableName from domain where domainName = '"+domainname+"'"
        # print(query1)
        cursor = db.cursor()
        cursor.execute(query1)
        records = cursor.fetchall()
        print(records[0][0])
        query2="select columnName from regularcolumn where domainName = '"+domainname+"'"
        cursor = db.cursor()
        cursor.execute(query2)
        records1 = cursor.fetchall()
        print(records1[1][0])
        if (records):
            print(records)
        else: 
            print("000")

        query = "select "+ records1[0][0]+","+records1[1][0]+" from "+records[0][0]+" where "+str
        print(query)
        cursor = db.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.close()
        db.close()
        
        outputs=[]

        for record in records:
            outputs.append(Output(name=record[0],url=record[1],id=records1[0][0],heading=records1[1][0]))

        return outputs


        for record in records:
            outputs.append(Output(name=record[0],url=record[1]))

        return outputs

    def resolve_domains(self, info):
        db = mysql.connect(
            host="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        query = "select domainName,factTableName from domain "
        cursor = db.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.close()
        db.close()
        #if len(records) == 0:
        #  return ??
        domains = []
        for record in records:
            domains.append(Domain(dname=record[0],ftname=record[1]))
        return domains

    def resolve_properties(self,info,domain):
        db = mysql.connect(
            host="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        query = "select propertyName,propertyQuestion,propertyDisplayType from property where domainName='"+domain+"' order by displayorder"
        cursor = db.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.close()
        
        #if len(records) == 0:
        #  return ??
        properties = []
        for record in records:
            #properties.append(Property(propertyname=record[0],propertyquestion=record[1],propertydisplaytype=record[2]))
            query="select allowedValue,allowedValueCode from propertydetail where propertyName='"+record[0]+"' and domainName='"+domain+"' order by allowedValueCode;"
            cursor=db.cursor()
            cursor.execute(query)
            sub_records=cursor.fetchall()
            cursor.close()
            property_options=[]
            for sub_record in sub_records:
                property_options.append(Propertyoption(allowedvalue=sub_record[0],allowedvalueCode=sub_record[1]))
            properties.append(Property(propertyname=record[0],propertyquestion=record[1],propertydisplaytype=record[2],propertoptions=property_options))

        db.close()
        return properties

class Deletebookmark(graphene.Mutation):
    # define output of mutation here
    ok = graphene.Boolean()
    userid = graphene.String()
    bookmarkname = graphene.String()
    # define data to be sent to server as part of insert
    class Arguments:
        userid = graphene.String()
        bookmarkname = graphene.String()
    # code to modify database
    def mutate(self, info, bookmarkname, userid):
        db = mysql.connect(
            host="localhost",
            database="mydb",
            user="root",
            passwd="password",
            auth_plugin='mysql_native_password'
        )
        sql1 = "delete from userbookmark"+" where "+ \
               "bname = '"+bookmarkname+"' and userid = '"+userid+"'"
        cursor = db.cursor()
        try:
            cursor.execute(sql1)
            db.commit()
            cursor.close()
            db.close()
            #print(sql)
            return Deletebookmark(ok=True,bookmarkname=bookmarkname,userid=userid)
        except Exception as e:
            #print(sql)
            #print(e)
            db.rollback()
            cursor.close()
            db.close()
            return Deletebookmark(ok=False,bookmarkname="",userid="")
class Mutations(graphene.ObjectType):
    create_bookmark = CreateBookmark.Field()
    delete_bookmark=Deletebookmark.Field()


schema = graphene.Schema(query=Queries,mutation=Mutations)        
