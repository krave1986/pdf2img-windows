try {
    # 从剪贴板获取文件列表
    $files = Get-Clipboard -Format FileDropList
}
catch {
    Write-Error "获取文件列表失败！"
    return
}

# 过滤文件列表中，扩展名为 .pdf 的文件
$pdfFiles = $files | Where-Object {
    $_.Extension -eq ".pdf"
}

if ($null -eq $pdfFiles) {
    Write-Error "没有复制有效的 PDF 文件！"
    return
}

# 如果代码走到这里，说明 $pdfFiles 中，已经包含了有效的 PDF 文件
# 准备遍历文件列表，并进行转换


foreach ($pdfFile in $pdfFiles) {


    $imagesDirectory = Join-Path -Path $PWD -ChildPath $pdfFile.BaseName

    # 这里使用 .Net API 的原因是：
    # 如果目录已经存在，使用 New-Item 的话，会报错
    # 要让它不报错的话，需要牺牲比较大的性能
    # 而 ::CreateDirectory 默认就不会报错，没有性能损失。
    # 是符合我们场景的最优解
    [System.IO.Directory]::CreateDirectory($imagesDirectory) | Out-Null

    # 创建完目录之后，调用 pdftoppm.exe 来生成图片
    pdftoppm.exe -png $pdfFile (Join-Path -Path $imagesDirectory "page")
}
