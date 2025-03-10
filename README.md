# Introduce

This extension converts the selected DCL codes into autolisp function and copy to clipboard.

The purpose of it is to nesting dcl codes into a single autolisp file.

# Example

The lisp function makes temporary DCL file on your system's temporary folder and return its path,

so you can use this as a parameter for `load_dialog` function like this

```lisp
; created temporary lisp file by this extension
(defun createDCL ( / )
  ;...
)

(setq path (createDCL)
      id (load_dialog path)
      name (vl-filename-base path) ; extract dialog name
)
(new_dialog name id)
(start_dialog)
(unload_dialog id)
(vl-file-delete path) ; it is recommended
```

- it is recommended to remove the created temporary dcl file after using it.

note that you have to extract the dialog name with `vl-filename-base` function.

actually, the dialog name of dcl codes are replaced with the name of the temporary file,

because it creates a new temporary file with new names every time it is called,

and it returns only filename, not the origin dialog name.

```dcl
dcl_name // it will be replaced with the name of the temporary file
: dialog {
  ...
}
```
