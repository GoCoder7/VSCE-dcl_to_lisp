(prompt "\nType TEST_DCL3 to run...")

(defun C:TEST_DCL3 ( / dcl_id fn fname)

(vl-load-com)

(create_dialog)

(setq dcl_id (load_dialog fname))
     (if (not (new_dialog "temp" dcl_id))
	 (exit )
     );if

(set_tile "name" "Enter Name Here")
(mode_tile "name" 2)
(action_tile "name" "(setq name $value)")
(action_tile "age" "(setq age $value)")
(action_tile "accept" "(val1)")

(start_dialog)
(unload_dialog dcl_id)

(alert (strcat "Your name is " name
               "\nand you are " age " years of age."))

(vl-file-delete fname)

(princ)

);defun

(defun val1 ()

(if (= (get_tile "name") "Enter Name Here")
	(progn
	   (set_tile "error" "You must enter a name!")
	   (mode_tile "name" 2)
	);progn
	(val2)
);if

);defun

(defun val2 ()

(if (< (atoi (get_tile "age")) 1)
	(progn
	  (set_tile "error" "Invalid Age - Please Try Again!!")
	  (mode_tile "age" 2)
	);progn
	(done_dialog)
);if

);defun

(defun create_dialog ()

(setq fname (vl-filename-mktemp "dcl.dcl"))

(setq fn (open fname "w"))

(write-line "temp : dialog { label = \"Test Dialog No 3\";
 : edit_box { label = \"Enter Your Name :\"; mnemonic = \"N\";
 key = \"name\"; alignment = centered; edit_limit = 30;
 edit_width = 30; } : edit_box { label = \"Enter Your Age :\";
 mnemonic = \"A\"; key =\"age\"; alignment = centered;
 edit_limit = 3; edit_width = 3; value = \"22\";
 } : button { key = \"accept\"; label = \"OK\";
 is_default = true; fixed_width = true; alignment = centered;
 } : errtile { width = 34; } }" fn)

(close fn)

);defun

(princ)