library(shiny)
library(mongolite)

mongo_host="localhost"
mongo_port=27017
url_path = sprintf("mongodb://%s:%s", mongo_host, mongo_port)  
mongo_database="test"
mongo_collection <- "models"  

mongo_con<-mongo(collection = mongo_collection
                 ,url = paste0(url_path,"/",mongo_database))

mySerializationFunc<-function(value){
  return (base64enc::base64encode(serialize(value, NULL,refhook = function(x) "dummy value")))
}

insertDocumentIntoCollection <- function(connection,object) {
  str<-paste0('{"modelName": "',object$modelName,'", "objectModel" :',paste0('{"$binary":{"base64":"',mySerializationFunc(object$objectModel),'","subType": "0"}}}'))
  connection$insert(str)
}

ui <- fluidPage(
  actionButton("aa","Generate model")
)

server <- function(input, output, session){
  observeEvent(input$aa,{
    lst<-list()
    lst$modelName<-"irisTestAll"
    lst$objectModel<-randomForest::randomForest(as.formula("Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width"),data=iris)
    
    # Store the model in mongoDB
    insertDocumentIntoCollection(mongo_con,lst)    
    
  })
}

shinyApp(ui, server)