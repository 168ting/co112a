// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// 填入第一個值
@2     // 第一個值 //@為A指令
D=A    // 值放入D
@0     
M=D    // 把 D 填入 M 0

@4     // 第二個值
D=A    // 值放入D
@1
M=D    // 把 D 填入 M 1
@11    // 把值放到 M 12裡面(@12是跳回的地方(D=D+M)，順便做判斷)
M=D    // 這個當作過渡變數，遞減判斷迴圈

D=0
@0    
D=D+M  // 把數字相加多次變成乘
@11
M=M-1  // 判定加的次數(第二個值)
M;JNE  // 如果 M == 0 跳出迴圈

@2     // 第三個數
M=D    // 把最後相乘的數放到 M 2

// 卡迴圈(無窮迴圈讓程式卡住，不再執行下去)
@18
0;JMP
