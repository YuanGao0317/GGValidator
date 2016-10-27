# GGValidator
Using Enum to implement validation functions in several ways.

The reason why I create it is that I think it is better to validate the fileds of forms in the Model rather than the View or the Controller. For failable initiallizer, it only returns nil which does not make sense to the View and Controller.

In this way, the initiallier can throw errors to the View or the Controller directly, and we move the validation logic out of the View and the Controller.

## How to use it
```
// We need to create a errorable initiallizer
init(...) throw {
		// Normal way
    guard
      GGValidator
        .required
        .isValid([title, author])
      else { 
      	throw GGValidationError.isEmpty
    }
    
    // Functional programming
    guard
      GGValidator
        .required
        .isValidWithArray([title, author], { (e) -> Bool in
          return e == ""
        }) else {
          throw GGValidationError.isEmpty
    }
    
    // Generic type
    guard
      GGValidator
        .required
        .isValidGeneric([title, author], checker: "")
      else {
      	throw GGValidationError.isEmpty
    }
}


// In the view
do {
  let model = try Model(...)
} catch {
	// Catch errors here
}
```


