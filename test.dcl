ppdf_241111
: dialog {
label = "PDF 프린터";

: text {
label = "'DWG to PDF.pc3'를 사용해 출력합니다";
}
: boxed_column {
label = "용지사이즈";

: popup_list {
key = "popup_list_media";
list = "A3(가로)\nA3(세로)\nA4(가로)\nA4(세로)";
action = "(_ON_SELECT)";
label = "";
width = 30;
alignment = top;
}
: text {
key = "text_cur_media";
value = "ISO_full_bleed_A3_(420.00_x_297.00_MM)";
width = 50;
alignment = centered;
}
}
: boxed_row {
label = "저장경로";

: text {
key = "text_file_path";
value = "C:\Program Files\Autodesk\AutoCAD 2025\Drawing1.dwg";
width = 50;
}
: button {
key = "btn_path_selector";
label = "경로설정";
action = "(_ON_PATH_SELECTOR)";
}
}
ok_cancel;
}
