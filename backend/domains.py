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

class Queries(graphene.ObjectType):
    domains=graphene.List(Domain)
    properties=graphene.List(Property,domain=graphene.String())
    output=graphene.List(Output,domainname=graphene.String(),str=graphene.String())
    
    
    def resolve_output(self, info, domainname, str):
        db = mysql.connect(
            host="localhost",
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

    

schema = graphene.Schema(query=Queries)