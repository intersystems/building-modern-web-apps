# Building Modern Web Applications
### By Michael Smart
### Presented at InterSystems Global Summit 2017

__Description:__ An example of a RESTful web service as implemented in Caché, and a client application designed in Angular.js that connects to the service. The two components are meant to demonstrate the concepts of modern web application design and serve as a companion piece to the presentation found here: https://learning.intersystems.com/course/view.php?id=681

__Requirements:__ Caché or Ensemble 2016.2 or higher.

__Instructions:__

1. Create the CSP application `/gs` for the desired namespace.
2. Make sure that the __CSP Physical Files Path__ setting is defined for the `/gs` CSP application.
3. Create the CSP application `/gs/api` and point it to the the same namespace as `/gs`.
4. Set the __Dispatch Class__ option for `/gs/api` to `Todo.REST`.
5. Load the files in the __BuildingModernWebApps__ directory to a new project using Atelier.
6. Compile the new project in Atelier.
7. Connect via Terminal to your instance and run the command `do ##class(Todo.Task).reset()` in the application namespace. This will generate the example data as seen in the presentation.
8. Open your web browser to `http://<server>:<port>/gs/index.html`.

Enjoy!
_— MS_