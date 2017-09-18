Class Todo.Task Extends %Persistent
{

Property text As %String;

Property completed As %Boolean;

Property important As %Boolean;

ClassMethod reset()
{
    Do ##class(Todo.Task).%DeleteExtent()
    Set tasks = [
        {"text": "Make dinner reservations", "important": 0, "completed": 0},
        {"text": "Get coffee", "important": 1, "completed": 0},
        {"text": "Book a hotel for my trip", "important": 0, "completed": 0},
        {"text": "Upgrade Caché", "important": 0, "completed": 0},
        {"text": "Update OS X", "important": 0, "completed": 1},
        {"text": "Buy a new camera lens", "important": 1, "completed": 1}
    ]
    
    Set iter = tasks.%GetIterator()
    While iter.%GetNext(,.obj) {
        Set task = ##class(Todo.Task).%New()
        Set task.text = obj.text
        Set task.important = obj.important
        Set task.completed = obj.completed
        Do task.%Save()
    }
}

Storage Default
{
<Data name="TaskDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>text</Value>
</Value>
<Value name="3">
<Value>completed</Value>
</Value>
<Value name="4">
<Value>important</Value>
</Value>
</Data>
<DataLocation>^Todo.TaskD</DataLocation>
<DefaultData>TaskDefaultData</DefaultData>
<IdLocation>^Todo.TaskD</IdLocation>
<IndexLocation>^Todo.TaskI</IndexLocation>
<StreamLocation>^Todo.TaskS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
