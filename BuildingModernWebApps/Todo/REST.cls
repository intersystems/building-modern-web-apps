Class Todo.REST Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/test" Method="GET" Call="Test" />
<Route Url="/tasks" Method="GET" Call="GetTasks" />
<Route Url="/tasks" Method="POST" Call="NewTask" />
<Route Url="/task/:id" Method="GET" Call="GetTask" />
<Route Url="/task/:id" Method="PUT" Call="UpdateTask" />
<Route Url="/task/:id" Method="DELETE" Call="DeleteTask" />
</Routes>
}

ClassMethod DeleteTask(id As %Integer) As %Status
{
    If '##class(Todo.Task).%ExistsId(id) {
        Set %response.Status = "404 Not Found"
        Quit 1
    }
    
    Do ##class(Todo.Task).%DeleteId(id)
    Quit 1
}

ClassMethod UpdateTask(id As %Integer) As %Status
{
    Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
    Set task = ##class(Todo.Task).%OpenId(id)
    If '$IsObject(task) {
        Set %response.Status = "404 Not Found"
        Quit 1
    }
    
    If obj.%IsDefined("text") {
        Set task.text = obj.text
    }
    
    If obj.%IsDefined("important") {
        Set task.important = obj.important
    }
    
    If obj.%IsDefined("completed") {
        Set task.completed = obj.completed
    }
    
    Do task.%Save()
    Quit 1
}

ClassMethod GetTask(id As %Integer) As %Status
{
    Set task = ##class(Todo.Task).%OpenId(id)
    If '$IsObject(task) {
        Set %response.Status = "404 Not Found"
        Quit 1
    }
    
    Set obj = {
        "id": (task.%Id()),
        "text": (task.text),
        "important": (task.important),
        "completed": (task.completed)
    }
    Write obj.%ToJSON()
    Quit 1
}

ClassMethod NewTask() As %Status
{
    Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
    Set task = ##class(Todo.Task).%New()
    
    If $length(obj.text) = 0 {
        Set %response.Status = "400 Bad Request"
        Quit 1
    }
    
    Set task.text = obj.text
    Set task.important = obj.important
    Set task.completed = 0
    
    Do task.%Save()
    Quit 1
}

ClassMethod GetTasks() As %Status
{
    Set obj = {"tasks": []}
    Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT id,text,important,completed FROM Todo.Task")
    While rs.%Next() {
        Set task = {
            "id": (rs.%Get("id")),
            "text": (rs.%Get("text")),
            "important": (rs.%Get("important")),
            "completed": (rs.%Get("completed"))
        }
        
        Do obj.tasks.%Push(task)
    }
    
    Write obj.%ToJSON()
    Quit 1
}

ClassMethod Test() As %Status
{
    Set obj = {
        "name": "Michael",
        "company": "InterSystems",
        "date": ($zdt($h,3,1))
    }
    
    Write obj.%ToJSON()
    
    Quit 1
}

}
