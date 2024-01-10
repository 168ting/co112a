// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// 偵測鍵盤位置有沒有輸入
@24576  // keyboard
D=M     // 把memory 24576的值取出
@0
D;JEQ   // 如果值為0就返回第一個

// 使用變數判斷迴圈到甚麼時候停
@8192  // 24576-16384 = 8192(把所有螢幕做調整，值會慢慢減，減到0跳出迴圈)
D=A    // 把值(8192)給 D
@10    // 把值放到 M 10裡面(@10是跳回的地方(A=D)，順便做判斷)
M=D

// 螢幕變白，開始迴圈
@16384
D=A    // 把值(16384)給 D
A=D    // 把值回傳給A (@D)
D=D+1  // 值會一直增加，所以迴圈時，位置也會一直上升
M=-1   // 把 M A 位置的值變 -1(黑色)

@10    
M=M-1  // M 10 遞減
M;JNE  // 如果 M == 0 就跳出迴圈，else 跳回10的地方做迴圈

// 螢幕變黑後，偵測keyboard是否放開(0)
@24576 
D=M    // 24576-16384 = 8192(把所有螢幕做調整，值會慢慢減，減到0跳出迴圈)
@16    // 把值(8192)給 D
D;JNE  // 如果 D == 0 就跳出迴圈，else 跳回16的地方做迴圈

// 使用變數判斷迴圈到甚麼時候停，這之後都跟上面(4. ~ 15.)的差不多
@8192  // 把數字存到M裡面
D=A    // 把值(16384)給 D
@26    // 把值放到 M 26裡面(@26是跳回的地方(A=D)，順便做判斷)
M=D

// 螢幕變白，
@16384 // 把值(16384)給 D
D=A    // 把值回傳給A (@D)
A=D    // 把值回傳給A (@D)
D=D+1  // 值會一直增加，所以迴圈時，位置也會一直上升
M=0   // 把 M A 位置的值變 0(白色)

@26
M=M-1  // M 10 遞減
M;JNE  // 如果 M == 0 就跳出迴圈，else 跳回25的地方做迴圈

// 結束一套，跳回原點
@0
0;JMP
