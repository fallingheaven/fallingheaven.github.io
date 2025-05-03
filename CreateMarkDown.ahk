#Requires AutoHotkey v2.0

; 創建GUI窗口
MyGui := Gui()
MyGui.Title := "Markdown文件創建工具"
MyGui.SetFont("s10", "Microsoft JhengHei")

; 添加輸入控件
EditFileName := MyGui.Add("Edit", "w300 vFileName", "新文章")
MyGui.Add("Text", "Section", "文件名稱（無需擴展名）:")
MyGui.Add("Text", "ys", "創建日期:")
EditDate := MyGui.Add("Edit", "ReadOnly vToday", GetToday())

; 添加按鈕
BtnCreate := MyGui.Add("Button", "w80 Default", "創建")
BtnCreate.OnEvent("Click", CreateMarkdown)

; 顯示窗口
MyGui.Show()
return

CreateMarkdown(btn, info) {
    ; 獲取輸入值
    filename := btn.Gui.Control["FileName"].Value
    today := btn.Gui.Control["Today"].Value
    
    ; 驗證輸入
    if (filename = "") {
        MsgBox "文件名稱不能為空！", "錯誤", "Icon!"
        return
    }
    
    ; 構建文件路徑
    basePath := A_ScriptDir "\content\post\"
    fullPath := basePath filename ".md"
    
    ; 創建目錄（如果不存在）
    if !DirExist(basePath) {
        DirCreate(basePath)
    }
    
    ; 寫入文件內容
    try {
        FileAppend(
            ("---`r`n" 
            . "title: """ filename """`r`n"  ; 注意这里使用.连接符
            . "date: " today "`r`n"
            . "tags: []`r`n"
            . "categories: []`r`n"
            . "---`r`n`r`n"), 
            fullPath, "UTF-8"
        )
        MsgBox "文件創建成功！`n`n路徑：" fullPath, "操作完成", "Iconi"
    } catch Error {
        MsgBox "文件創建失敗！`n`n錯誤信息：" Error.Message, "錯誤", "Icon!"
    }
}

GetToday() {
    ; 獲取當前日期（YYYY-MM-DD格式）
    return FormatTime(A_Now, "yyyy-MM-dd")
}