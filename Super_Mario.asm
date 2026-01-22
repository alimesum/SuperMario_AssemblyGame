; COAL LAB SEMESTER PROJECT
; MESUM ALI, 24I-0759
; SECTION F


INCLUDE Irvine32.inc
INCLUDELIB winmm.lib    ; Link Windows multimedia library so we can call sound/music APIs like PlaySound

PlaySound PROTO,
    pszSound:PTR BYTE,
    hmod:DWORD,
    fdwSound:DWORD


.data

; ----- main menu sound -----
mainmenuSound    BYTE "menu.wav",0    
coinSound    BYTE "coin.wav",0    
deathSound   BYTE "death.wav",0        
menuSound   BYTE "levelup.wav",0   
enemydeathSound   BYTE "hit.wav",0
magnetOnSound BYTE "magnet.wav",0



; ----- PlaySound flags -----
SND_SYNC      EQU 00000000h
SND_ASYNC     EQU 00000001h
SND_FILENAME  EQU 00020000h

menuSoundOn BYTE 0
gameSoundOn BYTE 0


     
    ; ============ MAIN MENU ============


    B1      BYTE "                  ___________________________________________________________________________________________           ", 0
    B2      BYTE "                  |#########################################################################################|           ", 0
    B3      BYTE "                  |#########################################################################################|           ", 0
    title1  BYTE "                  |##                                                                                     ##|           ", 0
    title2  BYTE "                  |##                     ______   __    __  _______   ________ ________                  ##|           ", 0
    title3  BYTE "                  |##                    /$$$$$$\ |$$\  |$$\|$$$$$$$\ |$$$$$$$$$\$$$$$$$\                 ##|           ", 0
    title4  BYTE "                  |##                   |$$$$$$$$\|$$$  |$$$|$$$$$$$$\|$$$$$$$$$|$$$$$$$$\                ##|           ", 0
    title5  BYTE "                  |##                   |$$$___\$$|$$$  |$$$|$$$__/$$$|$$$__    |$$$__|$$$                ##|           ", 0
    title6  BYTE "                  |##                    \$$$$$$\ |$$$  |$$$|$$$$$$$$$|$$$$$\   |$$$$$$$$                 ##|           ", 0
    title7  BYTE "                  |##                    _\$$$$$$\|$$$  |$$$|$$$$$$$$ |$$$$$$   |$$$$$$$$\                ##|           ", 0
    title8  BYTE "                  |##                   |$$\__|$$$|$$$__/$$$|$$$      |$$$_____ |$$$  |$$$                ##|           ", 0
    title9  BYTE "                  |##                    \$$$$$$$$ \$$$$$$$$|$$$      |$$$$$$$$\|$$$  |$$$                ##|           ", 0
    title10 BYTE "                  |##                     \$$$$$$   \$$$$$$  \$$       \$$$$$$$$ \$$   \$$                ##|           ", 0
    title11 BYTE "                  |##                                                                                     ##|           ", 0
    title12 BYTE "                  |##                                                                                     ##|           ", 0
    title13 BYTE "                  |##                     __       __   ______   _______   ______   ______                ##|           ", 0
    title14 BYTE "                  |##                    |$$\     /$$\ /$$$$$$\ |$$$$$$$\ |$$$$$$\ /$$$$$$\               ##|           ", 0
    title15 BYTE "                  |##                    |$$$\   /$$$$|$$$$$$$$\|$$$$$$$$\ \$$$$$$|$$$$$$$$\              ##|           ", 0
    title16 BYTE "                  |##                    |$$$$\ /$$$$$|$$$__|$$$|$$$__|$$$  |$$$  |$$$  |$$$              ##|           ", 0
    title17 BYTE "                  |##                    |$$$$$\$$$$$$|$$$$$$$$$|$$$$$$$$$  |$$$  |$$$  |$$$              ##|           ", 0
    title18 BYTE "                  |##                    |$$$\$$$$$$$$|$$$$$$$$$|$$$$$$$$\  |$$$  |$$$  |$$$              ##|           ", 0
    title19 BYTE "                  |##                    |$$$ \$$$|$$$|$$$  |$$$|$$$  |$$$ _|$$$_ |$$$__/$$$              ##|           ", 0
    title20 BYTE "                  |##                    |$$$  \$ |$$$|$$$  |$$$|$$$  |$$$|$$$$$$\ \$$$$$$$$              ##|           ", 0
    title21 BYTE "                  |##                     \$$      \$$ \$$   \$$ \$$   \$$ \$$$$$$| \$$$$$$               ##|           ", 0
    title22 BYTE "                  |##                                                                                     ##|           ", 0
    title23 BYTE "                  |##                                                                                     ##|           ", 0
    title24 BYTE "                  |##                          ______                                                     ##|           ", 0
    title25 BYTE "                  |##                         /$$$$$$\                                                    ##|           ", 0
    title26 BYTE "                  |##                        |$$$$$$$$\  ______    ______    _______                      ##|           ", 0
    title27 BYTE "                  |##                        |$$$__/$$$ /$$$$$$\  /$$$$$$\  /$$$$$$$\                     ##|           ", 0
    title28 BYTE "                  |##                        |$$$$$$$$$|$$$$$$$$\|$$$$$$$$\|$$$$$$$$$                     ##|           ", 0
    title29 BYTE "                  |##                        |$$$$$$$$\|$$$   \$$|$$$  |$$$ \$$    \                      ##|           ", 0
    title30 BYTE "                  |##                        |$$$__/$$$|$$$      |$$$__/$$$ _\$$$$$$\                     ##|           ", 0
    title31 BYTE "                  |##                        |$$$$$$$$$|$$$      |$$$$$$$$/|$      $$                     ##|           ", 0
    title32 BYTE "                  |##                         \$$$$$$$  \$$       \$$$$$$/  \$$$$$$$/                     ##|           ", 0
    title33 BYTE "                  |##                                                                                     ##|           ", 0
    B4      BYTE "                  |#########################################################################################|           ", 0
    B5      BYTE "                  |_________________________________________________________________________________________|           ", 0 
    rollNum BYTE "                                         Roll Number: 24I-0759 (Green Shirt Mario)                                      ", 0
    player BYTE  "                                                      1 PLAYER GAME                                                     ", 0


    ; ==================== GAME OVER ====================

gameOver1  BYTE "  $$$$$$\   $$$$$$\  $$\      $$\ $$$$$$$$\ ", 0
gameOver2  BYTE " $$  __$$\ $$  __$$\ $$$\    $$$ |$$  _____|", 0
gameOver3  BYTE " $$ /  \__|$$ /  $$ |$$$$\  $$$$ |$$ |      ", 0
gameOver4  BYTE " $$ |$$$$\ $$$$$$$$ |$$\$$\$$ $$ |$$$$$\    ", 0
gameOver5  BYTE " $$ |\_$$ |$$  __$$ |$$ \$$$  $$ |$$  __|   ", 0
gameOver6  BYTE " $$ |  $$ |$$ |  $$ |$$ |\$  /$$ |$$ |      ", 0
gameOver7  BYTE " \$$$$$$  |$$ |  $$ |$$ | \_/ $$ |$$$$$$$$\ ", 0
gameOver8  BYTE "  \______/ \__|  \__|\__|     \__|\_______| ", 0
space      BYTE "                                            ", 0
gameOver9  BYTE "  $$$$$$\  $$\    $$\ $$$$$$$$\ $$$$$$$\    ", 0
gameOver10 BYTE " $$  __$$\ $$ |   $$ |$$  _____|$$  __$$\   ", 0
gameOver11 BYTE " $$ /  $$ |$$ |   $$ |$$ |      $$ |  $$ |  ", 0
gameOver12 BYTE " $$ |  $$ |\$$\  $$  |$$$$$\    $$$$$$$  |  ", 0
gameOver13 BYTE " $$ |  $$ | \$$\$$  / $$  __|   $$  __$$ |  ", 0
gameOver14 BYTE " $$ |  $$ |  \$$$  /  $$ |      $$ |  $$ |  ", 0
gameOver15 BYTE "  $$$$$$  |   \$  /   $$$$$$$$\ $$ |  $$ |  ", 0
gameOver16 BYTE "  \______/     \_/    \________|\__|  \__|  ", 0




; ==================== LEVEL COMPLETE ====================
levelComplete1  BYTE " $$\      $$$$$$$$\ $$\    $$\ $$$$$$$$\ $$\       ", 0
levelComplete2  BYTE " $$ |     $$  _____|$$ |   $$ |$$  _____|$$ |      ", 0
levelComplete3  BYTE " $$ |     $$ |      $$ |   $$ |$$ |      $$ |      ", 0
levelComplete4  BYTE " $$ |     $$$$$\    \$$\  $$  |$$$$$\    $$ |      ", 0
levelComplete5  BYTE " $$ |     $$  __|    \$$\$$  / $$  __|   $$ |      ", 0
levelComplete6  BYTE " $$ |     $$ |        \$$$  /  $$ |      $$ |      ", 0
levelComplete7  BYTE " $$$$$$$$\$$$$$$$$\    \$  /   $$$$$$$$\ $$$$$$$$\ ", 0
levelComplete8  BYTE " \________\________|    \_/    \________|\________|", 0
space1          BYTE "                                                                                      ", 0
levelComplete9  BYTE "  $$$$$$\   $$$$$$\  $$\      $$\ $$$$$$$\  $$\       $$$$$$$$\ $$$$$$$$\ $$$$$$$$\   ", 0   
levelComplete10 BYTE " $$  __$$\ $$  __$$\ $$$\    $$$ |$$  __$$\ $$ |      $$  _____|\\__$$  __|$$  _____| ", 0      
levelComplete11 BYTE " $$ /  \__|$$ /  $$ |$$$$\  $$$$ |$$ |  $$ |$$ |      $$ |         $$ |   $$ |        ", 0     
levelComplete12 BYTE " $$ |      $$ |  $$ |$$\$$\$$ $$ |$$$$$$$  |$$ |      $$$$$\       $$ |   $$$$$\      ", 0     
levelComplete13 BYTE " $$ |      $$ |  $$ |$$ \$$$  $$ |$$  ____/ $$ |      $$  __|      $$ |   $$  __|     ", 0      
levelComplete14 BYTE " $$ |  $$\ $$ |  $$ |$$ |\$  /$$ |$$ |      $$ |      $$ |         $$ |   $$ |        ", 0    
levelComplete15 BYTE " \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$ |      $$$$$$$$\ $$$$$$$$\    $$ |   $$$$$$$$\   ", 0   
levelComplete16 BYTE "  \______/  \______/ \__|     \__|\__|      \________|\________|   \__|   \________|  ", 0     





    ; ==================== INSTRUCTIONS ====================

InstTitle1 BYTE "  $$$$$$\ $$\   $$\  $$$$$$\ $$$$$$$$\ $$$$$$$\  $$\   $$\  $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\   ", 0  
InstTitle2 BYTE "  \_$$  _|$$$\  $$ |$$  __$$\\__$$  __|$$  __$$\ $$ |  $$ |$$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |  ", 0
InstTitle3 BYTE "    $$ |  $$$$\ $$ |$$ /  \__|  $$ |   $$ |  $$ |$$ |  $$ |$$ /  \__|  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |  ", 0
InstTitle4 BYTE "    $$ |  $$ $$\$$ |\$$$$$$\    $$ |   $$$$$$$  |$$ |  $$ |$$ |        $$ |     $$ |  $$ |  $$ |$$ $$\$$ |  ", 0
InstTitle5 BYTE "    $$ |  $$ \$$$$ | \____$$\   $$ |   $$  __$$ |$$ |  $$ |$$ |        $$ |     $$ |  $$ |  $$ |$$ \$$$$ |  ", 0
InstTitle6 BYTE "    $$ |  $$ |\$$$ |$$\   $$ |  $$ |   $$ |  $$ |$$ |  $$ |$$ |  $$\   $$ |     $$ |  $$ |  $$ |$$ |\$$$ |  ", 0
InstTitle7 BYTE "  $$$$$$\ $$ | \$$ |\$$$$$$  |  $$ |   $$ |  $$ |\$$$$$$  |\$$$$$$  |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |  ", 0
InstTitle8 BYTE "  \______|\__|  \__| \______/   \__|   \__|  \__| \______/  \______/   \__|   \______| \______/ \__|  \__|  ", 0
Separator1 BYTE "============================================================================================================", 0
Separator2 BYTE "============================================================================================================", 0

; ==================== HIGH SCORES ====================

highScores0  BYTE "$$\   $$\ $$$$$$\  $$$$$$\  $$\   $$\     $$$$$$\   $$$$$$\   $$$$$$\ |$$$$$$$\ |$$$$$$$$\  $$$$$$\      ", 0
highScores1  BYTE "$$ |  $$ |\_$$  _|$$  __$$\ $$ |  $$ |   $$  __$$\ $$  __$$\ $$  __$$\|$$  __$$\|$$  _____|$$  __$$\     ", 0
highScores2  BYTE "$$ |  $$ |  $$ |  $$ /  \__|$$ |  $$ |   $$ /  \__|$$ /  \__|$$ /  $$ |$$ |  $$ |$$ |      $$ /  \__|    ", 0
highScores3  BYTE "$$$$$$$$ |  $$ |  $$ |$$$$\ $$$$$$$$ |   \$$$$$$\  $$ |      $$ |  $$ |$$$$$$$  |$$$$$\    \$$$$$$\      ", 0
highScores4  BYTE "$$  __$$ |  $$ |  $$ |\_$$ |$$  __$$ |    \____$$\ $$ |      $$ |  $$ |$$  __$$ |$$  __|    \____$$\     ", 0
highScores5  BYTE "$$ |  $$ |  $$ |  $$ |  $$ |$$ |  $$ |   $$\   $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |      $$\   $$ |    ", 0
highScores6  BYTE "$$ |  $$ |$$$$$$\ \$$$$$$  |$$ |  $$ |   \$$$$$$  |\$$$$$$  | $$$$$$  |$$ |  $$ |$$$$$$$$\ \$$$$$$  |    ", 0
highScores7  BYTE "\__|  \__|\______| \______/ \__|  \__|    \______/  \______/  \______/ \__|  \__|\________| \______/     ", 0



; ==================== PAUSE ====================
pause0  BYTE "$$$$$$$\   $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\    ", 0
pause1  BYTE "$$  __$$\ $$  __$$\ $$ |  $$ |$$  __$$\ $$  _____|   ", 0
pause2  BYTE "$$ |  $$ |$$ /  $$ |$$ |  $$ |$$ /  \__|$$ |         ", 0
pause3  BYTE "$$$$$$$  |$$$$$$$$ |$$ |  $$ |\$$$$$$\  $$$$$\       ", 0
pause4  BYTE "$$  ____/ $$  __$$ |$$ |  $$ | \____$$\ $$  __|      ", 0
pause5  BYTE "$$ |      $$ |  $$ |$$ |  $$ |$$\   $$ |$$ |         ", 0
pause6  BYTE "$$ |      $$ |  $$ |\$$$$$$  |\$$$$$$  |$$$$$$$$\    ", 0
pause7  BYTE "\__|      \__|  \__| \______/  \______/ \________|   ", 0


; ==================== 3D MARIO CASTLE (SMALL) ====================

castle1  BYTE "    _____       _____ ", 0
castle2  BYTE "   |  |  |     |  |  |", 0
castle3  BYTE "   |[]|[]|     |[]|[]|", 0
castle4  BYTE " __|__|__|__ __|__|__|__", 0
castle5  BYTE "|    ___    |    ___    |", 0
castle6  BYTE "|   |_*_|   |   |_*_|   |", 0
castle7  BYTE "|   |___|   |   |___|   |", 0
castle8 BYTE  "|   |###|   |   |###|   |", 0
castle9 BYTE  "|   |###|   |   |###|   |", 0 
castle10 BYTE "|___________|___________|", 0


    ; Ground display 
    ground BYTE  "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????", 0
    ; Blue background line (fill with spaces)
    skyLine BYTE "                                                                                                                        ", 0
    skyLength DWORD 0   

    pauseBoxTop      BYTE  "+----------------------------------------+",0
    pauseBoxMid      BYTE  "|                                        |",0
    pauseBoxBottom   BYTE  "+----------------------------------------+",0
    pauseTitleLine   BYTE  "|              GAME PAUSED              |",0
    pauseOptionsLine BYTE  "|    1) Resume      2) Exit to Menu     |",0
    pausePrompt      BYTE  "Select option (1-2): ",0

    ; Pause Menu (screen text)
    pauseTitle BYTE "======== GAME PAUSED ========", 0
    pauseOpt1  BYTE "  1. Resume Game", 0
    pauseOpt2  BYTE "  2. Exit to Menu", 0
    gameOverActive BYTE 0      ; 0 = normal, 1 = game over state


    ; Menu Options
    line BYTE    "                                                    =================                                                   ", 0
    Option1 BYTE "                                                    1. START GAME                                                       ", 0
    Option2 BYTE "                                                    2. HIGH SCORES                                                      ", 0
    Option3 BYTE "                                                    3. INSTRUCTIONS                                                     ", 0
    Option4 BYTE "                                                    4. EXIT                                                             ", 0
    prompt BYTE  "                                                    => Select (1-4):                                                    ", 0
    menuTop BYTE "                                                    HIGH SCORE - 000000                                                 ", 0


    ;Sprite Ascii Designs

    mario_row1 BYTE "_O_", 0                 
    mario_row2 BYTE "/|\", 0  
    mario_row3 BYTE "/ \", 0


    ; Medium bush
    bushMed1 BYTE "@"            , 0
    bushMed2 BYTE "@@@"          , 0
    bushMed3 BYTE "@@@@@"        , 0
    bushMed4 BYTE "@@@@@@@"      , 0
   

    ; Medium cloud
    cloudMed1 BYTE "____"               , 0
    cloudMed2 BYTE "(    )"             , 0
    cloudMed3 BYTE "(          )"       , 0
    cloudMed4 BYTE "(______________)"   , 0

    ; Medium pipe (3 blocks high)
    pipeMed1 BYTE "----------"   , 0
    pipeMed2 BYTE "|      |"     , 0
    pipeMed3 BYTE "|      |"     , 0
    pipeMed4 BYTE "|      |"     , 0
    pipeMed5 BYTE "|      |"     , 0
    pipeMed6 BYTE "|      |"     , 0


    ; Goomba sprite (2 rows)
    goombaRow1 BYTE "/@\",0
    goombaRow2 BYTE "(@)",0

    MAX_GOOMBAS_PER_PAGE = 2
    TOTAL_GOOMBAS = MAX_GOOMBAS_PER_PAGE * 3    ; 6 total

    goombaXArr      BYTE TOTAL_GOOMBAS DUP(0)
    goombaYArr      BYTE TOTAL_GOOMBAS DUP(0)
    goombaDirArr    SBYTE TOTAL_GOOMBAS DUP(0)
    goombaActiveArr BYTE TOTAL_GOOMBAS DUP(0)

    currentGoombaBase  BYTE 0      ; 0,2,4
    currentGoombaCount BYTE 0      ; always 0..2
    RESPAWN_X = 20
    RESPAWN_Y = 57

    goombaLastXArr BYTE TOTAL_GOOMBAS DUP(0)
    goombaLastYArr BYTE TOTAL_GOOMBAS DUP(0)
    goombaStepArr    BYTE  TOTAL_GOOMBAS DUP(0)   ; per-goomba frame counter
    GOOMBA_STEP_TICKS = 3                         ; 5 frames per step (slow), adjust



    ; ---------- Coin Magnet Power-up ----------
    magnetX      BYTE 0     ; power-up column (per page adjust karenge)
    magnetY      BYTE 0      ; power-up row (ground se thora upar)
    magnetActive BYTE 1       ; 1 = visible, 0 = already taken

    ; Simple magnet sprite (M)
    magnetRow   BYTE " M ", 0

    ; Magnet effect state
    coinMagnetActive  BYTE 0      ; 1 = magnet ON
    coinMagnetTimer   DWORD 0     ; frames remaining
    MAGNET_DURATION   = 150       ; 150 frames ? 5 sec (agar ~30 FPS)

    
    ; Instructions Text
    instTitle BYTE "========== GAME INSTRUCTIONS ==========", 0
    inst1 BYTE " CONTROLS:", 0
    inst2 BYTE "W or w    - Jump", 0
    inst3 BYTE "A or a    - Move Left", 0
    inst4 BYTE "D or d    - Move Right", 0
    inst5 BYTE "ESC       - Exit Game", 0
    inst6 BYTE "P or p    - Pause Game", 0
    inst8 BYTE " OBJECTIVE:", 0
    inst9 BYTE "- Reach the flagpole at end of level", 0
    inst10 BYTE "- Collect coins for points", 0
    inst11 BYTE "- Jump on enemies to defeat them", 0
    inst12 BYTE "- Get power-ups like Magnet(M)", 0
    back BYTE "  Press any key to return to menu...", 0

    

    ; High Score Display
    scoreTitle BYTE "=========== HIGH SCORES ===========", 0
    score1 BYTE "  1. ", 0
    score2 BYTE "  2. ", 0
    score3 BYTE "  3. ", 0
    score4 BYTE "  4. ", 0
    score5 BYTE "  5. ", 0
    noScores BYTE "     No scores yet! Be the first!", 0
    scorePrompt BYTE " ", 0
    scoreBack BYTE "  Press any key to return to menu...", 0

 
    ; General Messages
    invalidInput BYTE "  Invalid input! Try again.", 0
    pressKey BYTE "  Press any key to continue...", 0
    newLine BYTE 0dh, 0ah, 0


    ; Mario state
    marioX      BYTE 20      ; start column
    marioY      BYTE 57      ; top on ground (rows 57,58,59 -> feet 59)
    marioVelX   SDWORD 0
    marioVelY   SDWORD 0
    marioOnGround BYTE 1
    lastMarioX  BYTE 20
    lastMarioY  BYTE 57

    ; Physics
    GRAVITY         = 1
    MAX_FALL_SPEED  = 5

    PIPE_TOP    = 53          ; DrawPipeMedium row
    PIPE_LEFT   = 80          ; choose 80 (adjust if you want)
    PIPE_RIGHT  = 89          ; 10 chars: 80..89

    ; Ground
    GROUND_Y    = 59          ; Mario feet row


    ; ---------- HUD state ----------
    score       DWORD 0        ; total score
    coins       DWORD 0        ; collected coins
    timeLeft    DWORD 400      ; starting time
    lives       BYTE  3        ; lives remaining

    ; HUD label strings
    hudScoreLbl BYTE "SCORE:    ",0
    hudCoinsLbl BYTE "COINS:    ",0
    hudWorldLbl BYTE "WORLD: "   ,0
    hudTimeLbl  BYTE "TIME:     ",0
    hudLivesLbl BYTE "LIVES:    ",0
    magnetHudLbl BYTE "MAGNET: ",0
    worldVal    BYTE "1-1",0   ; current world name


    ; ---------- SIMPLE PAGE-BASED SCROLLING STATE ----------

    currentPage   BYTE 0        ; 0 = first part of level, 1 = second part

    page0_pipeX   BYTE 8
    page0_bushL   BYTE 7
    page0_bushR   BYTE 100

    page1_pipeX   BYTE 50
    page1_bushL   BYTE 7
    page1_bushR   BYTE 90

    page2_pipeX   BYTE 70
    page2_bushL   BYTE 5
    page2_bushR   BYTE 50

    currentPipeLeft  BYTE 80
    currentPipeRight BYTE 89


    ; Coin sprite
    coinChar   BYTE "$", 0

    MAX_COINS_PER_PAGE = 5      ; per page max 5 coins

    ; All coins for all pages (page 0,1,2) ? total 15 slots
    TOTAL_COINS = MAX_COINS_PER_PAGE * 3

    coinXArr   BYTE TOTAL_COINS DUP(0)
    coinYArr   BYTE TOTAL_COINS DUP(0)
    coinOnArr  BYTE TOTAL_COINS DUP(0)   ; 1 = active, 0 = collected
    currentCoinBase BYTE 0    ; start index for this page (0,5,10)
    currentCoinCount BYTE 0   ; kitne coins is page par active slots

    ;time counter
    frameCounter DWORD 0     ; timer ke liye frame counter


    
   ; ---------- Player Name ----------
   
    ; current player name input
    inputName         BYTE 32 DUP(0)      ; ReadString buffer
    currentPlayerName BYTE 32 DUP(0)      ; global current name
    playerNameSet     BYTE 0              ; 0 = not set, 1 = set

    ; prompt
    enterNameMsg BYTE "Enter your name: ",0
    bytesWritten DWORD ?
    bytesRead    DWORD ?



    ; ============ CONSOLE SETTINGS ============
    consoleTitle BYTE "Super Mario Bros - 24I-0759", 0
    
    ; Level intro
    levelIntroMsg BYTE "              LEVEL 1              ", 0
    
    ; Exit Message
    exitMsg1 BYTE " Goodbye! See you next time!", 0
    exitMsg2 BYTE " Press any key to close the window...", 0


    ; -------- CASTLE PAGE-1 ENVIRONMENT --------

castleBrickRow BYTE "########################################################################################################################",0
castleLavaRow  BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

; Moving platform over lava
platformRow    BYTE "=====",0
platformX      BYTE 30      ; left column of platform
platformY      BYTE 52      ; row of platform
platformDir    SBYTE 1      ; +1 right, -1 left

; Firebar pivot
FIREBAR_CENTER_X EQU 60
FIREBAR_CENTER_Y EQU 46
firebarPhase   BYTE 0       ; 0..3 orientation index


; ------------- LEVEL SELECT / BOSS STATE -------------

currentLevel      BYTE 1           ; 1 = Level 1, 2 = Boss level

chooseLevelMsg    BYTE "Choose level: 1 = WORLD 1-1   2 = BOSS CASTLE",0
invalidLevelMsg   BYTE "Invalid choice! Starting WORLD 1-1...",0



; ========== HIGH SCORE FILE SYSTEM (existing) ==========
highScoreFileName  BYTE "highscores.txt", 0
fileHandle         DWORD ?
tempBuffer         BYTE 128 DUP(0)      
scoreLineBuffer    BYTE 100 DUP(0)      

CREATE_ALWAYS      = 2
OPEN_ALWAYS        = 4
GENERIC_WRITE      = 40000000h
GENERIC_READ       = 80000000h
FILE_SHARE_READ    = 1
emptySlotText BYTE "---", 0

; ========== TOP 10 STORAGE ARRAYS ==========
MAX_SCORES = 10       

topScoreNames  BYTE MAX_SCORES * 32 DUP(0)  ; 10 names x 32 chars
topScores      DWORD MAX_SCORES DUP(0)       ; 10 scores
topLevels      BYTE MAX_SCORES * 8 DUP(0)   ; 10 level strings
heading db "  NAME | SCORE | WORLD "




    ; Colors
    RED = 12
    YELLOW = 14
    WHITE = 15
    BLUE = 9
    DARK_GREEN = 2
    GREEN = 10
    BROWN = 6
    LIGHTGRAY = 7
    DARKGRAY = 8
    CYAN = 11
    MAGENTA = 13
    BLACK = 0
   

.code
main PROC
    
    INVOKE SetConsoleTitleA, ADDR consoleTitle
    call Clrscr
    call ShowMainMenu
    
    exit
main ENDP


;---------------------------------------------------------
; ShowMainMenu - Displays the main menu and handles input
;---------------------------------------------------------
ShowMainMenu PROC
    push eax
    push edx

MenuLoop:

    ; agar menu sound abhi OFF hai, to start hojaye
    cmp menuSoundOn, 1
    je  AfterMenuSound

    INVOKE PlaySound, ADDR mainmenuSound, 0, SND_FILENAME OR SND_ASYNC
    mov menuSoundOn, 1

AfterMenuSound:
    mov skyLength, 60         ; main menu: full blue
    call Clrscr
    call DrawBlueBackground
    call MenuTitleScreen

    mov dh, 56
    mov dl, 7
    call DrawBushMedium

    mov dh, 56
    mov dl, 100
    call DrawBushMedium

    mov dh, 44
    mov dl, 10
    call DrawCloudMedium

    mov dh, 24
    mov dl, 30
    call DrawCloudMedium

    mov dh, 48
    mov dl, 102
    call DrawCloudMedium

    mov dh, 6
    mov dl, 7
    call DrawCloudMedium

    mov dh, 13
    mov dl, 95
    call DrawCloudMedium

    mov dh, 54
    mov dl, 80
    call DrawPipeMedium

    mov dh, 54
    mov dl, 40
    call DrawPipeMedium

    mov dh, 57
    mov dl, 20
    call DrawMario

    call DrawGround

    call GetMenuChoice
    
    ; Process menu choice
    cmp al, '1'
    je StartGame
    cmp al, '2'
    je ShowHighScores
    cmp al, '3'
    je ShowInstructions
    cmp al, '4'
    je ExitGame
    
    ; Invalid input
    call Crlf
    mov edx, OFFSET invalidInput
    call WriteString
    call Crlf
    mov edx, OFFSET pressKey
    call WriteString
    call ReadChar
    jmp MenuLoop

StartGame:
    ; menu sound stop
    INVOKE PlaySound, 0, 0, 0
    mov menuSoundOn, 0

    ; game BG sound start (same as before)
    cmp gameSoundOn, 1
    je  SkipStartGameSound
    INVOKE PlaySound, ADDR menuSound, 0, SND_FILENAME OR SND_ASYNC
    mov gameSoundOn, 1
SkipStartGameSound:

    ; Instead of jumping straight to Level1,
    ; go through the shared level intro / selector
    call ShowLevelIntro

    ; When the selected level finishes, return to main menu loop
    jmp MenuLoop

ShowHighScores:
    call Clrscr
    call DisplayHighScores
    jmp MenuLoop

ShowInstructions:
    call Clrscr
    call DisplayInstructions
    jmp MenuLoop

ExitGame:
    call Clrscr
    call ShowExitMessage
    
    pop edx
    pop eax
    ret
ShowMainMenu ENDP




;---------------------------------------------------------
; GetMenuChoice - Gets user's menu selection
;---------------------------------------------------------
GetMenuChoice PROC
    
    push edx
    mov dh, 54
    mov dl, 69
    call Gotoxy
    call ReadChar
    
    pop edx
    ret
GetMenuChoice ENDP



;---------------------------------------------------------
; DisplayInstructions - Shows game instructions
;---------------------------------------------------------
DisplayInstructions PROC
    push eax
    push edx
    
    call Clrscr
    call DrawBlueBackground
    
    
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    mov dh, 2
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle1
    call WriteString

    mov dh, 3
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle2
    call WriteString

    mov dh, 4
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle3
    call WriteString

    mov dh, 5
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle4
    call WriteString

    mov dh, 6
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle5
    call WriteString

    mov dh, 7
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle6
    call WriteString

    mov dh, 8
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle7
    call WriteString

    mov dh, 9
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET InstTitle8
    call WriteString

    mov dh, 11
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator1
    call WriteString

    mov dh, 12
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator2
    call WriteString
    
    ; Display all instruction lines

    mov eax, WHITE + (RED * 16)
    call SetTextColor

    mov dh, 15
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET inst1
    call WriteString
    
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    mov dh, 17
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst2
    call WriteString
 

    mov dh, 18
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst3
    call WriteString
    

    mov dh, 19
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst4
    call WriteString
    
    mov dh, 20
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst5
    call WriteString

    mov dh, 21
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst6
    call WriteString
 
    
    mov eax, WHITE + (RED * 16)
    call SetTextColor

    mov dh, 24
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET inst8
    call WriteString
   

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    

    mov dh, 26
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst9
    call WriteString


    mov dh, 27
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst10
    call WriteString
    
    mov dh, 28
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst11
    call WriteString
    

    mov dh, 29
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET inst12
    call WriteString
    
    mov eax, WHITE + (RED * 16)
    call SetTextColor

    mov dh, 31
    mov dl, 40
    call Gotoxy
    mov edx, OFFSET back
    call WriteString
    call ReadChar

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    
    pop edx
    pop eax
    ret
DisplayInstructions ENDP




;---------------------------------------------------------
; ShowExitMessage - Displays exit message
;---------------------------------------------------------

ShowExitMessage PROC
    push eax
    push edx
    
    call Crlf
    call Crlf
    mov eax, YELLOW
    call SetTextColor
    mov edx, OFFSET exitMsg1
    call WriteString
    call Crlf
    
    mov eax, WHITE
    call SetTextColor
    mov edx, OFFSET exitMsg2
    call WriteString
    call Crlf
    call Crlf
    
    pop edx
    pop eax
    ret
ShowExitMessage ENDP


;---------------------------------------------------------
; DrawGround - Draws green ground at bottom of screen
;---------------------------------------------------------

DrawGround PROC
    push eax
    push edx
    push ecx
    
    ; Set ground color
    mov eax, DARK_GREEN + (DARK_GREEN * 16)
    call SetTextColor
    
    mov ecx, 5       ; Number of rows to fill
    mov dh, 60       ; Starting row (after blue sky)
    mov dl, 0        ; Start from left edge
    call Gotoxy
    
FillGreenLoop:
    push ecx
    mov edx, OFFSET ground
    call WriteString
    inc dh              ; Move to next row
    pop ecx
    loop FillGreenLoop
    
    ; Reset color
    mov eax, WHITE + (BLACK * 16)
    call SetTextColor
    
    pop ecx
    pop edx
    pop eax
    ret
DrawGround ENDP


;---------------------------------------------------------
; DrawBlueBackground - Fills background with blue color
;---------------------------------------------------------

DrawBlueBackground PROC
    push eax
    push edx
    push ecx

    ; Set blue background color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; ecx = skyLength (kitni rows fill karni hain)
    mov eax, skyLength
    mov ecx, eax

    mov dh, 0
    mov dl, 0
    call Gotoxy

FillBlueLoop:
    push ecx
    mov edx, OFFSET skyLine
    call WriteString
    inc dh
    pop ecx
    loop FillBlueLoop

    ; Reset color
    mov eax, WHITE
    call SetTextColor

    pop ecx
    pop edx
    pop eax
    ret
DrawBlueBackground ENDP



;-------------------------------------------------------------
; Menu Title Screen - Draws the title & menu options on screen
;-------------------------------------------------------------

MenuTitleScreen PROC
    push eax
    push edx

    ; Set white text on blue background for menu
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    mov dh, 2        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET menuTop
    call WriteString

    ; Set yellow text on blue background for menu
    mov eax, BROWN + (BLUE * 16)
    call SetTextColor

    mov dh, 3        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET B1
    call WriteString
    
    mov dh, 4        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET B2
    call WriteString
    
    mov dh, 5        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET B3
    call WriteString
    
    mov dh, 6        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title1
    call WriteString
    
    mov dh, 7        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title2
    call WriteString
    
    mov dh, 8        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title3
    call WriteString
    
    mov dh, 9        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title4
    call WriteString
    
    mov dh, 10        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title5
    call WriteString
    
    mov edx, OFFSET title6
    call WriteString
    
    mov dh, 11        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title7
    call WriteString
    
    mov dh, 12        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title8
    call WriteString
    
    mov dh, 13        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title9
    call WriteString
    
    mov dh, 14        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title10
    call WriteString
    
    mov dh, 15        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title11
    call WriteString
    
    mov dh, 16        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title12
    call WriteString
    
    mov dh, 17        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title13
    call WriteString
    
    mov dh, 18        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title14
    call WriteString
    
    mov dh, 19        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title15
    call WriteString
    
    mov dh, 20        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title16
    call WriteString
    
    mov dh, 21        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title17
    call WriteString
    
    mov dh, 22        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title18
    call WriteString
    
    mov dh, 23        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title19
    call WriteString
    
    mov dh, 24       
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title20
    call WriteString

    mov dh, 25        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET title21
    call WriteString

    ; Set red text on blue background for menu
    mov eax, RED + (BLUE * 16)
    call SetTextColor

    mov dh, 26 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title22
    call WriteString
    
    mov dh, 27 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title23
    call WriteString

    mov dh, 28 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title24
    call WriteString
    
    mov dh, 29 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title25
    call WriteString
    
    mov dh, 30 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title26
    call WriteString
    
    mov dh, 31 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title27
    call WriteString
    
    mov dh, 32 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title28
    call WriteString
    
    mov dh, 33 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title29
    call WriteString
    
    mov dh, 34 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title30
    call WriteString
    
    mov dh, 35 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title31
    call WriteString
    
    mov dh, 36 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title32
    call WriteString
    
    mov dh, 37
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET title33
    call WriteString
    
    mov dh, 38 
    mov dl, 0      
    call Gotoxy
    mov edx, OFFSET B4
    call WriteString

    mov dh, 39       
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET B5
    call WriteString

    ; Set white text on blue background for menu
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    
    ; Roll Number
    mov dh, 43        
    mov dl, 0          
    call Gotoxy
    mov edx, OFFSET rollNum
    call WriteString
    
    ; 1 PLAYER GAME option
    mov dh, 44
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET player
    call WriteString
    
    ; Menu separator
    mov dh, 48
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET line
    call WriteString
    
    ; Option 1
    mov dh, 49
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET Option1
    call WriteString
    
    ; Option 2
    mov dh, 50
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET Option2
    call WriteString
    
    ; Option 3
    mov dh, 51
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET Option3 
    call WriteString
    
    ; Option 4
    mov dh, 52
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET Option4
    call WriteString
    
    ; Another separator
    mov dh, 53
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET line
    call WriteString
    
    ; Prompt
    mov dh, 54
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET prompt
    call WriteString

    ; Reset color
    mov eax, WHITE + (BLACK * 16)
    call SetTextColor
    
    pop edx
    pop eax
    ret
MenuTitleScreen ENDP


;-------------------------------------------------------------
;DrawBushMedium - Draws a medium bush at specified position
;-------------------------------------------------------------


DrawBushMedium PROC
    ; Parameters: 
    ;   dh = starting row position
    ;   dl = starting column position
    push eax
    push edx
    push ebx
    
    mov bl, dh              ; Save starting row in bl
    mov bh, dl              ; Save starting column in bh
    mov eax, GREEN + (DARK_GREEN * 16)
    call SetTextColor
    
    ; Row 1
    mov dh, bl              ; Use starting row
    mov dl, bh              ; Use starting column
    call Gotoxy
    mov edx, OFFSET bushMed1
    call WriteString
    
    ; Row 2
    dec bh                ; Move to one column back for centering
    inc bl                ; Move to next row
    mov dh, bl
    mov dl, bh         ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET bushMed2
    call WriteString
    
    ; Row 3
    dec bh
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET bushMed3
    call WriteString

    ; Row 4
    dec bh
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET bushMed4
    call WriteString

    
    pop ebx
    pop edx
    pop eax
    ret
DrawBushMedium ENDP


;-------------------------------------------------------------
;DrawCloudMedium - Draws a medium cloud at specified position
;-------------------------------------------------------------

DrawCloudMedium PROC
    ; Parameters: 
    ; dh = starting row position
    ; dl = starting column position
    push eax
    push edx
    push ebx
    
    mov bl, dh    
    mov bh, dl
    mov eax, WHITE + (WHITE * 16)
    call SetTextColor
    
    ; Row 1
    mov dh, bl              ; Use starting row
    mov dl, bh              ; Use starting column
    call Gotoxy
    mov edx, OFFSET cloudMed1
    call WriteString
    
    ; Row 2
    dec bh                  ; Move to one column back for centering
    inc bl                  ; Move to next row
    mov dh, bl
    mov dl, bh              ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET cloudMed2
    call WriteString
    
    ; Row 3
    sub bh, 3
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET cloudMed3
    call WriteString
    
    ; Row 4
    sub bh, 2
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET cloudMed4
    call WriteString
    
    pop ebx
    pop edx
    pop eax
    ret
DrawCloudMedium ENDP


;-------------------------------------------------------------
;DrawPipeMedium - Draws a medium pipe at specified position
;-------------------------------------------------------------


DrawPipeMedium PROC
    ; Parameters: 
    ;   dh = starting row position
    ;   dl = starting column position
    push eax
    push edx
    push ebx
    
    mov bl, dh    
    mov bh, dl
    mov eax, WHITE + (GREEN * 16)
    call SetTextColor
    
    ; Row 1
    mov dh, bl              ; Use starting row
    mov dl, bh              ; Use starting column
    call Gotoxy
    mov edx, OFFSET pipeMed1
    call WriteString
    
    ; Row 2
    inc bh                  ; Move to one column back for centering
    inc bl                  ; Move to next row
    mov dh, bl
    mov dl, bh             ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET pipeMed2
    call WriteString
    
    ; Row 3
    inc bl
    mov dh, bl
    mov dl, bh             ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET pipeMed3
    call WriteString
    
    ; Row 4
    inc bl
    mov dh, bl
    mov dl, bh               ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET pipeMed4
    call WriteString
    
    ; Row 5
    inc bl
    mov dh, bl
    mov dl, bh            ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET pipeMed5
    call WriteString

    ; Row 6
    inc bl
    mov dh, bl
    mov dl, bh             ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET pipeMed6
    call WriteString

    pop ebx
    pop edx
    pop eax
    ret
DrawPipeMedium ENDP


;-------------------------------------------------------------
; DrawMario - Draws Mario sprite at specified position 
; Input: dh = row, dl = column
;-------------------------------------------------------------

DrawMario PROC
    push eax
    push ebx
    push edx
    
    mov bl, dh              ; Save row in bl
    mov bh, dl              ; Save column in bh
    
    ; Set Mario color (Black on blue background)
    mov eax, BLACK + (BLUE * 16)
    call SetTextColor

    ; Row 1 - Head
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET mario_row1
    call WriteString
    
    mov eax, BLACK + (GREEN * 16)
    call SetTextColor

    ; Row 2 - Body
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET mario_row2
    call WriteString
    
    mov eax, BLACK + (BLUE * 16)
    call SetTextColor

    ; Row 3 - Legs
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET mario_row3
    call WriteString

    ; Reset color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edx
    pop ebx
    pop eax
    ret
DrawMario ENDP

;-------------------------------------------------------------
; Level1 - Simple loop, 1 pipe + scoring hooks
;-------------------------------------------------------------
Level1 PROC
    push eax
    push ebx
    push ecx
    push edx

    mov currentPage, 0
    mov timeLeft, 400
    mov frameCounter, 0

    ; page 0 magnet position
    mov magnetX,  55
    mov magnetY, 50
    mov magnetActive, 1
    mov coinMagnetActive, 0
    mov coinMagnetTimer, 0

    ; init Mario
    mov marioX, 20
    mov marioY, 57
    mov lastMarioX, 20
    mov lastMarioY, 57
    mov marioVelX, 0
    mov marioVelY, 0
    mov marioOnGround, 1
    mov skyLength, 60

    call Clrscr
    call InitCoinsForPage
    call InitGoombasForPage
    call DrawBlueBackground
    call DrawStaticElements
    call DrawHUD
    call DrawAllCoins
    call DrawMagnet

GameLoop:
    ; remember safe pos
    mov al, marioX
    mov lastMarioX, al
    mov al, marioY
    mov lastMarioY, al

    ; small delay
    mov eax, 25
    call Delay

    ; ---------- input ----------
    call ReadKey
    jz NormalPhysics

    cmp al, 27               ; ESC -> exit level
    je ExitLevel

    ; pause
    cmp al, 'p'
    je DoPause
    cmp al, 'P'
    je DoPause

    ; jump
    cmp al, 'w'
    je DoJump
    cmp al, 'W'
    je DoJump

    ; left
    cmp al, 'a'
    je MoveLeft
    cmp al, 'A'
    je MoveLeft

    ; right
    cmp al, 'd'
    je MoveRight
    cmp al, 'D'
    je MoveRight

    jmp NormalPhysics

; ----- jump (only from ground) -----
DoJump:
    cmp marioOnGround, 1
    jne NormalPhysics
    mov marioVelY, -5
    mov marioOnGround, 0
    jmp NormalPhysics

; ----- walk left -----
MoveLeft:
    movzx eax, marioX
    cmp eax, 2
    jle NormalPhysics
    dec marioX
    call CheckPipeCollision
    jmp NormalPhysics

MoveRight:
    movzx eax, marioX
    cmp eax, 115
    jge NormalPhysics
    
    inc marioX
    call CheckPipeCollision        
    
    movzx eax, marioX
    cmp eax, 110
    jle NormalPhysics
    
    ; Page switching
    movzx eax, currentPage
    cmp eax, 0
    je SwitchToPage1
    cmp eax, 1
    je SwitchToPage2
    jmp NormalPhysics

SwitchToPage1:
    mov currentPage, 1
    call InitCoinsForPage
    call InitGoombasForPage
    
    ; Update magnet position for page 1
    mov magnetX, 60
    mov magnetY, 50
    mov magnetActive, 1
    
    jmp DoPageRedraw

SwitchToPage2:
    mov currentPage, 2
    call InitCoinsForPage
    call InitGoombasForPage
    
    ; Update magnet for page 2
    mov magnetX, 70
    mov magnetY, 48
    mov magnetActive, 1

DoPageRedraw:
    call Clrscr
    mov skyLength, 40
    call DrawBlueBackground
    call DrawStaticElements         
    call DrawHUD
    call DrawAllCoins
    call DrawMagnet
    
    mov marioX, 20
    mov dh, marioY
    mov dl, marioX
    call DrawMario
    
    jmp NormalPhysics


DoPause:
    call ShowPauseMenu
    
    ; AL = 1 (Resume) or 2 (Exit)
    cmp al, 1
    je ResumeGame
    cmp al, 2
    je ExitLevel                    
    
    ; Fallback (shouldn't reach)
    jmp GameLoop

ResumeGame:
    ; Redraw everything
    call Clrscr
    mov skyLength, 40
    call DrawBlueBackground
    call DrawStaticElements
    call DrawHUD
    call DrawAllCoins
    call DrawMagnet
    call DrawAllGoombas
    
    mov dh, marioY
    mov dl, marioX
    call DrawMario
    
    jmp GameLoop


; ---------- Game Over aware physics ----------



NormalPhysics:
    ; Game Over state check
    cmp gameOverActive, 1
    jne PhysicsStep

    ; GAME OVER screen ek dafa + ESC
    INVOKE PlaySound, ADDR mainmenuSound, 0, SND_FILENAME OR SND_ASYNC
    mov menuSoundOn, 1

GameOverLoop:
 
    ; ON (white on blue)
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    
    mov dh, 42
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver1
    call WriteString

    mov dh, 43
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver2
    call WriteString

    mov dh, 44
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver3
    call WriteString

    mov dh, 45
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver4
    call WriteString

    mov dh, 46
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver5
    call WriteString

    mov dh, 47
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver6
    call WriteString

    mov dh, 48
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver7
    call WriteString

    mov dh, 49
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver8
    call WriteString

    mov dh, 50
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dh, 51
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver9
    call WriteString

    mov dh, 52
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver10
    call WriteString

    mov dh, 53
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver11
    call WriteString

    mov dh, 54
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver12
    call WriteString

    mov dh, 55
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver13
    call WriteString

    mov dh, 56
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver14
    call WriteString

    mov dh, 57
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver15
    call WriteString

    mov dh, 58
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver16
    call WriteString

    mov eax, 200
    call Delay
    call RedrawNearbyObjects

    ; OFF (red text on blue, same area)
    mov eax, RED + (BLUE * 16)
    call SetTextColor

    mov dh, 42
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver1
    call WriteString

    mov dh, 43
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver2
    call WriteString

    mov dh, 44
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver3
    call WriteString

    mov dh, 45
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver4
    call WriteString

    mov dh, 46
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver5
    call WriteString

    mov dh, 47
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver6
    call WriteString

    mov dh, 48
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver7
    call WriteString

    mov dh, 49
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver8
    call WriteString

    mov dh, 50
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dh, 51
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver9
    call WriteString

    mov dh, 52
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver10
    call WriteString

    mov dh, 53
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver11
    call WriteString

    mov dh, 54
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver12
    call WriteString

    mov dh, 55
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver13
    call WriteString

    mov dh, 56
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver14
    call WriteString

    mov dh, 57
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver15
    call WriteString

    mov dh, 58
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET gameOver16
    call WriteString

    ; blink ke bad thora delay
    mov eax, 200
    call Delay
    call RedrawNearbyObjects

    ; ESC ka wait
    call ReadKey
    jz  GameOverLoop
    cmp al, 27
    jne GameOverLoop

    jmp ExitLevel


; ---------- normal physics ----------
PhysicsStep:
    ; 1) Purani sprites erase
    call EraseMario

    ; 2) Physics + world collisions
    call ApplyPhysicsLevel1
    call CheckPipeCollision

    ; 3) Gameplay collisions / effects
    call CheckAllCoinsCollision
    call CheckMagnetCollision
    call UpdateAllGoombas
    call CheckAllGoombasCollision

    ; 4) Drawing (nayi positions)
    mov dh, marioY
    mov dl, marioX
    call DrawMario

    call DrawAllCoins
    call DrawMagnet
    call DrawAllGoombas

    ; 5) Magnet HUD/timer
    call UpdateMagnet

    ; 6) LEVEL TIMER
    inc frameCounter
    mov eax, frameCounter
    cmp eax, 10
    jl  SkipLevelTimer

    mov frameCounter, 0

    mov eax, timeLeft
    cmp eax, 0
    jle SkipLevelTimer
    dec eax
    mov timeLeft, eax

    call DrawHUD

    ; 7) LEVEL COMPLETE CHECK
CheckLevelCompleteSimple:
    movzx eax, currentPage
    cmp eax, 2              ; 3rd page?
    jne SkipLevelTimer

    movzx eax, marioX
    cmp eax, 100            ; castle area?
    jl  SkipLevelTimer

    movzx edx, marioY
    add edx, 2              ; feet row
    cmp edx, GROUND_Y
    jne SkipLevelTimer
    
    ; LEVEL COMPLETE SOUND (ek martaba)
    INVOKE PlaySound, ADDR menuSound, 0, SND_FILENAME OR SND_ASYNC

LevelCompleteLoop:

    ; ==== LEVEL COMPLETE BANNER ON (WHITE on BLUE) ====
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; UPPER "LEVEL" PART (lines 1-8)
    mov dh, 42
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete1
    call WriteString

    mov dh, 43
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete2
    call WriteString

    mov dh, 44
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete3
    call WriteString

    mov dh, 45
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete4
    call WriteString

    mov dh, 46
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete5
    call WriteString

    mov dh, 47
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete6
    call WriteString

    mov dh, 48
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete7
    call WriteString

    mov dh, 49
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET levelComplete8
    call WriteString

    ; ON delay
    mov eax, 200
    call Delay

    ; ==== LEVEL COMPLETE BANNER OFF (BLUE background overwrite) ====
    mov eax, BLUE + (BLUE * 16)
    call SetTextColor

    ; same area ko blank space se fill karo
    mov dh, 42
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 43
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 44
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 45
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 46
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 47
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 48
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 49
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    ; OFF delay
    mov eax, 200
    call Delay
    call RedrawNearbyObjects

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; ek blank line
    mov dh, 50
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    ; LOWER "COMPLETED" PART (lines 9-16)
    mov dh, 51
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete9
    call WriteString

    mov dh, 52
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete10
    call WriteString

    mov dh, 53
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete11
    call WriteString

    mov dh, 54
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete12
    call WriteString

    mov dh, 55
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete13
    call WriteString

    mov dh, 56
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete14
    call WriteString

    mov dh, 57
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete15
    call WriteString

    mov dh, 58
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET levelComplete16
    call WriteString

    ; ON delay
    mov eax, 200
    call Delay


    mov dh, 51
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 52
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 53
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 54
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 55
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 56
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 57
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    mov dh, 58
    mov dl, 15
    call Gotoxy
    mov edx, OFFSET space1
    call WriteString

    ; OFF delay
    mov eax, 200
    call Delay
    call RedrawNearbyObjects

    ; ==== ESC check (blink loop jaisa Game Over) ====
    call ReadKey
    jz  LevelCompleteLoop      ; no key -> blink continue
    cmp al, 27                 ; ESC?
    jne LevelCompleteLoop      ; ignore other keys
    ; ESC dabaya -> level exit
    jmp ExitLevel

SkipLevelTimer:
    jmp GameLoop

ExitLevel:

    call SaveHighScore
    mov lives, 3
    mov timeLeft, 400
    mov score, 0
    mov coins, 0
    mov gameOverActive, 0
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

Level1 ENDP


;---------------------------------------------------------
; EraseMario - Erases Mario and redraws nearby objects
;---------------------------------------------------------
EraseMario PROC
    push eax
    push ebx
    push ecx
    push edx

    mov eax, BLUE + (BLUE * 16)
    call SetTextColor

    movzx ebx, lastMarioY       ; erase where he was
    mov ecx, 3                  ; 3 rows

EraseLoop:
    mov dh, bl
    mov dl, lastMarioX          ; start from old X
    call Gotoxy

    push ecx
    mov ecx, 3                  ; 3 columns = sprite width
WriteSpaces:
    mov al, ' '
    call WriteChar
    loop WriteSpaces
    pop ecx

    inc bl
    loop EraseLoop

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    call RedrawNearbyObjects

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
EraseMario ENDP


;---------------------------------------------------------
; RedrawNearbyObjects - Redraws objects near Mario
;---------------------------------------------------------
RedrawNearbyObjects PROC
    push eax
    push ebx
    push edx

    movzx eax, marioX
    movzx ebx, marioY

    ; Ground
    cmp ebx, 50
    jl CheckStatic
    call DrawGround

CheckStatic:
    movzx eax, currentPage
    
    cmp eax, 0
    je Page0Static
    cmp eax, 1
    je Page1Static
    cmp eax, 2
    je Page2Static
    jmp Done

Page0Static:
    ; Pipe
    mov dh, 54
    mov dl, page0_pipeX
    call DrawPipeMedium
    
    ; Bushes
    mov dh, 56
    mov dl, page0_bushL
    call DrawBushMedium
    
    mov dh, 56
    mov dl, page0_bushR
    call DrawBushMedium
    
    mov dh, 45
    mov dl, 10
    call DrawCloudMedium
    
    mov dh, 48
    mov dl, 102
    call DrawCloudMedium
    
    jmp Done

Page1Static:
    mov dh, 54
    mov dl, page1_pipeX
    call DrawPipeMedium
    
    mov dh, 56
    mov dl, page1_bushL
    call DrawBushMedium
    
    mov dh, 56
    mov dl, page1_bushR
    call DrawBushMedium
    
    mov dh, 44
    mov dl, 10
    call DrawCloudMedium
    
    mov dh, 48
    mov dl, 102
    call DrawCloudMedium
    
    jmp Done

Page2Static:
    mov dh, 54
    mov dl, page2_pipeX
    call DrawPipeMedium
    
    mov dh, 56
    mov dl, page2_bushL
    call DrawBushMedium
    
    mov dh, 56
    mov dl, page2_bushR
    call DrawBushMedium
    
    mov dh, 48
    mov dl, 10
    call DrawCloudMedium
    
    mov dh, 38
    mov dl, 85
    call DrawCloudMedium

    
Done:
    pop edx
    pop ebx
    pop eax
    ret
RedrawNearbyObjects ENDP





;---------------------------------------------------------
; ApplyPhysicsLevel1 - Dynamic pipe collision per page
;---------------------------------------------------------
ApplyPhysicsLevel1 PROC
    push eax
    push ebx
    push edx
    push ecx

    ; Update current pipe bounds based on page
    call UpdatePipeBounds

    ; already resting?
    cmp marioOnGround, 1
    je DonePhysics

    ; gravity
    mov eax, marioVelY
    add eax, GRAVITY
    cmp eax, MAX_FALL_SPEED
    jle StoreFall
    mov eax, MAX_FALL_SPEED
StoreFall:
    mov marioVelY, eax

    ; candidate new top
    movzx ebx, marioY
    add ebx, eax                ; EBX = newY_top

    ; ----- pipe-top landing (falling only) -----
    cmp marioVelY, 0
    jle CheckGround

    ; feet = newY_top + 2
    mov edx, ebx
    add edx, 2                  ; feetY

    cmp edx, PIPE_TOP           ; feet reach 54?
    jl CheckGround

    ; X overlap with pipe? (use dynamic bounds)
    movzx eax, marioX
    mov ecx, eax
    add ecx, 2                  ; Mario right edge
    
    movzx edx, currentPipeLeft
    cmp ecx, edx
    jl CheckGround
    
    movzx edx, currentPipeRight
    cmp eax, edx
    jg CheckGround

    ; land on pipe: feet 54 -> top 52
    mov ebx, PIPE_TOP - 2       ; 52
    mov marioVelY, 0
    mov marioOnGround, 1
    jmp SaveY

; ----- ground landing (feet 59 -> top 57) -----
CheckGround:
    mov edx, ebx
    add edx, 2                  ; feet candidate
    cmp edx, GROUND_Y           ; 59
    jl CheckCeiling

    mov ebx, GROUND_Y - 2       ; 57
    mov marioVelY, 0
    mov marioOnGround, 1
    jmp SaveY

; ----- ceiling clamp -----
CheckCeiling:
    cmp ebx, 3
    jge SaveY
    mov ebx, 3
    mov marioVelY, 0

SaveY:
    mov marioY, bl

DonePhysics:
    pop ecx
    pop edx
    pop ebx
    pop eax
    ret
ApplyPhysicsLevel1 ENDP



; ---------------------------------------------------------
; ShowLevelIntro - Shared intro + level selector
;   - Shows intro screen (once per game start)
;   - Asks: 1 = Level 1,  2 = Boss Level
;   - Sets HUD world label and calls chosen level
; ---------------------------------------------------------
ShowLevelIntro PROC
    push eax
    push ebx
    push ecx
    push edx

    ; Full blue background
    call Clrscr
    mov skyLength, 60
    call DrawBlueBackground

    cmp playerNameSet, 1
    je  NameAlreadySet

    mov dh, 5
    mov dl, 45
    call Gotoxy
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    mov edx, OFFSET levelIntroMsg     ; "LEVEL 1" line
    call WriteString

    call GetPlayerName                ; fills currentPlayerName etc

NameAlreadySet:

    ; Level select prompt
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    mov dh, 9
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET chooseLevelMsg
    call WriteString

    mov eax, BLACK + (White * 16)
    call SetTextColor

    mov dh, 11
    mov dl, 55
    call Gotoxy
    mov edx, OFFSET pausePrompt          
    call WriteString


WaitLevelChoice:
    call ReadChar
    cmp al, '1'
    je  ChooseLevel1
    cmp al, '2'
    je  ChooseBoss

    ; invalid -> message + default Level 1
    mov dh, 13
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET invalidLevelMsg
    call WriteString

    mov currentLevel, 1
    jmp Level1StartFromIntro

ChooseLevel1:
    mov currentLevel, 1
    ; HUD world label "1-1"
    mov BYTE PTR worldVal,   '1'
    mov BYTE PTR worldVal+1, '-'
    mov BYTE PTR worldVal+2, '1'
    mov BYTE PTR worldVal+3, 0
    jmp Level1StartFromIntro

ChooseBoss:
    mov currentLevel, 2
    ; HUD world label "BOSS"
    mov BYTE PTR worldVal,   'B'
    mov BYTE PTR worldVal+1, 'O'
    mov BYTE PTR worldVal+2, 'S'
    mov BYTE PTR worldVal+3, 'S'
    mov BYTE PTR worldVal+4, 0
    jmp BossStartFromIntro

; ------------ start actual levels ------------

Level1StartFromIntro:
    ; Short delay so text is visible
    mov eax, 1500
    call Delay

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    call Clrscr
    mov skyLength, 60
    call DrawBlueBackground
    call Level1                      ; your existing level


    jmp IntroExit                    ; when Level1 returns, back to menu

BossStartFromIntro:
    mov eax, 1500
    call Delay

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    call Clrscr
    mov skyLength, 60
    call DrawBlueBackground
    call BossLevel                   ; NEW boss level (defined next section)

IntroExit:
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
ShowLevelIntro ENDP


;---------------------------------------------------------
; DrawStaticElements - Draws all non-moving objects (paged)
;   Uses currentPage to choose layout for World 1-1
;---------------------------------------------------------
DrawStaticElements PROC
    push eax
    push ebx
    push edx

    ; select layout based on currentPage
    movzx eax, currentPage
    cmp eax, 0
    je  Page0Layout
    cmp eax, 1
    je  Page1Layout
    jmp Page2Layout


; ---------- PAGE 0 LAYOUT ----------
Page0Layout:
    ; BUSHES (use variables)
    mov dh, 56
    mov dl, page0_bushL         
    call DrawBushMedium

    mov dh, 56
    mov dl, page0_bushR        
    call DrawBushMedium

    ; CLOUDS
    mov dh, 48
    mov dl, 102
    call DrawCloudMedium

    mov dh, 45
    mov dl, 10
    call DrawCloudMedium

    ; PIPE (use variable)
    mov dh, 54
    mov dl, page0_pipeX       
    call DrawPipeMedium

    jmp DrawGroundAndExit

; ---------- PAGE 1 LAYOUT ----------
Page1Layout:
    ; BUSHES (use variables)
    mov dh, 56
    mov dl, page1_bushL       
    call DrawBushMedium

    mov dh, 56
    mov dl, page1_bushR         
    call DrawBushMedium

    ; CLOUDS
    mov dh, 44
    mov dl, 10
    call DrawCloudMedium

    mov dh, 48
    mov dl, 102
    call DrawCloudMedium

    ; PIPE (use variable)
    mov dh, 54
    mov dl, page1_pipeX         
    call DrawPipeMedium

    jmp DrawGroundAndExit


; ---------- PAGE 2 LAYOUT ----------
Page2Layout:
    ; BUSHES (use variables)
    mov dh, 56
    mov dl, page2_bushL       
    call DrawBushMedium

    mov dh, 56
    mov dl, page2_bushR         
    call DrawBushMedium

    ; CLOUDS
    mov dh, 48
    mov dl, 10
    call DrawCloudMedium

    mov dh, 38
    mov dl, 85
    call DrawCloudMedium

    ; PIPE (use variable)
    mov dh, 54
    mov dl, page2_pipeX       
    call DrawPipeMedium

    mov dh, 50
    mov dl, 95
    call DrawCastle

    jmp DrawGroundAndExit

DrawGroundAndExit:
    ; GROUND (same for all pages)
    call DrawGround

    pop edx
    pop ebx
    pop eax
    ret
DrawStaticElements ENDP




;---------------------------------------------------------
; RedrawLevel - Redraws entire level (background, static elements, Mario)
;---------------------------------------------------------

RedrawLevel PROC
    push eax
    push edx

    mov skyLength, 40        ; Level1 wali sky height
    call DrawBlueBackground
    call DrawStaticElements      ; ground bhi yahin se draw ho raha

    ; Mario ko bhi dobara draw karo
    mov dh, marioY
    mov dl, marioX
    call DrawMario

    pop edx
    pop eax
    ret
RedrawLevel ENDP


;---------------------------------------------------------
; UpdatePipeBounds - Sets currentPipeLeft/Right based on page
;---------------------------------------------------------
UpdatePipeBounds PROC
    push eax
    push ebx

    movzx eax, currentPage
    cmp eax, 0
    je SetPage0Pipe
    cmp eax, 1
    je SetPage1Pipe
    cmp eax, 2
    je SetPage2Pipe
    jmp UPB_Done

SetPage0Pipe:
    movzx ebx, page0_pipeX
    jmp CalculateBounds

SetPage1Pipe:
    movzx ebx, page1_pipeX
    jmp CalculateBounds

SetPage2Pipe:
    movzx ebx, page2_pipeX

CalculateBounds:
    ; Pipe is 10 chars wide: X to X+9
    mov currentPipeLeft, bl
    add bl, 9
    mov currentPipeRight, bl

UPB_Done:
    pop ebx
    pop eax
    ret
UpdatePipeBounds ENDP



;---------------------------------------------------------
; CheckPipeCollision - Dynamic pipe collision per page
;---------------------------------------------------------
CheckPipeCollision PROC
    push eax
    push ebx
    push ecx
    push edx

    ; Update pipe bounds first
    call UpdatePipeBounds

    ; build Mario box
    movzx eax, marioX           ; X_left
    movzx ebx, marioY           ; Y_top
    mov ecx, eax
    add ecx, 2                  ; X_right
    mov edx, ebx
    add edx, 2                  ; Y_bottom

    ; horizontal overlap with pipe? (use dynamic bounds)
    movzx edx, currentPipeLeft
    cmp ecx, edx
    jl NoCol
    
    movzx edx, currentPipeRight
    cmp eax, edx
    jg NoCol

    ; vertical checks
    cmp ebx, 52                 ; <= 52 -> above / on rim
    jle NoCol
    cmp ebx, 60                 ; >= 60 -> below body
    jge NoCol

    ; inside pipe body -> rollback
    mov al, lastMarioX
    mov marioX, al
    mov al, lastMarioY
    mov marioY, al

NoCol:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckPipeCollision ENDP



;---------------------------------------------------------
; ShowPauseMenu - Returns choice in AL
;   AL = 1 -> Resume
;   AL = 2 -> Exit to menu
;---------------------------------------------------------
ShowPauseMenu PROC
    push ebx                       
    push ecx
    push edx

    call Clrscr

    INVOKE PlaySound, ADDR mainmenuSound, 0, SND_FILENAME OR SND_ASYNC
    mov menuSoundOn, 1
    call DrawBlueBackground

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; Pause ASCII art
    mov dh, 2
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause0
    call WriteString

    mov dh, 3
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause1
    call WriteString

    mov dh, 4
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause2
    call WriteString

    mov dh, 5
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause3
    call WriteString

    mov dh, 6
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause4
    call WriteString

    mov dh, 7
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause5
    call WriteString

    mov dh, 8
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause6
    call WriteString

    mov dh, 9
    mov dl, 35
    call Gotoxy
    mov edx, OFFSET pause7
    call WriteString

    mov dh, 11
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator1
    call WriteString

    mov dh, 12
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator2
    call WriteString

    ; Options
    mov dh, 15
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET pauseOpt1
    call WriteString

    mov dh, 17
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET pauseOpt2
    call WriteString

    mov dh, 19
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET pausePrompt
    call WriteString

WaitPauseKey:
    call ReadChar
    cmp al, '1'
    je ResumeFromPause
    cmp al, '2'
    je ExitFromPause
    jmp WaitPauseKey

ResumeFromPause:
    ; Stop menu sound
    INVOKE PlaySound, 0, 0, 0
    mov menuSoundOn, 0
    
    mov al, 1                       ; Return code = Resume
    
    pop edx
    pop ecx
    pop ebx
    ret                             ; Clean return to Level1

ExitFromPause:
    ; Keep menu sound playing (already started)
    
    mov al, 2                       ; Return code = Exit
    
    pop edx
    pop ecx
    pop ebx
    ret                             ; Clean return to Level1

ShowPauseMenu ENDP




;-------------------------------------------------------------
; Draw HUD TEXT which shows during game
;-------------------------------------------------------------


DrawHUD PROC
    push eax
    push ebx
    push ecx
    push edx

    
    ; text color: white on blue (jaise background)
    mov eax, RED + (BLUE * 16)
    call SetTextColor

    ; row 35, column 0 se start
    ; SCORE:
    mov dh, 35
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET hudScoreLbl
    call WriteString

    mov eax, score          ; score value
    call WriteDec           ; decimal number print

    ; COINS:
    mov dh, 36
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET hudCoinsLbl
    call WriteString

    mov eax, coins
    call WriteDec

    ; WORLD:
    mov dh, 35
    mov dl, 55
    call Gotoxy
    mov edx, OFFSET hudWorldLbl
    call WriteString

    mov edx, OFFSET worldVal
    call WriteString

    ; TIME:
    mov dh, 35
    mov dl, 105
    call Gotoxy
    mov edx, OFFSET hudTimeLbl
    call WriteString

    mov eax, timeLeft
    call WriteDec

    ; LIVES:
    mov dh, 36
    mov dl, 105
    call Gotoxy
    mov edx, OFFSET hudLivesLbl
    call WriteString

    ; lives BYTE hai, is liye pehle zero-extend karke EAX mein laaye gae
    movzx eax, lives
    call WriteDec

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DrawHUD ENDP




;-------------------------------------------------------------
; Draw all coins in the game
;-------------------------------------------------------------


DrawAllCoins PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    ; ---------- base index for this page ----------
    movzx esi, currentPage
    mov edx, MAX_COINS_PER_PAGE
    imul esi, edx              ; ESI = base index (0,5,10)

    mov ecx, MAX_COINS_PER_PAGE ; per page 5 coins

DAC_Loop:
    cmp ecx, 0
    jle DAC_End

    ; coin ACTIVE?
    mov al, [coinOnArr + esi]
    cmp al, 1
    jne DAC_Next

    ; coinX / coinY
    mov dl, [coinXArr + esi]
    mov dh, [coinYArr + esi]

    mov eax, YELLOW + (RED * 16)
    call SetTextColor

    call Gotoxy
    mov edx, OFFSET coinChar
    call WriteString

DAC_Next:
    inc esi
    dec ecx
    jmp DAC_Loop

DAC_End:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DrawAllCoins ENDP



;-------------------------------------------------------------
; InitCoinsForPage - initializes coin positions for current page
;   Har page mein max 5 coins (page 0,1,2)
;-------------------------------------------------------------

InitCoinsForPage PROC
    push eax
    push ebx
    push ecx
    push edx

    ; base = currentPage * MAX_COINS_PER_PAGE
    movzx eax, currentPage
    mov bl, MAX_COINS_PER_PAGE
    mul bl
    mov currentCoinBase, al
    mov currentCoinCount, MAX_COINS_PER_PAGE

    movzx ebx, al           ; EBX = base index

    ; ---- sab 5 coins ko pehle 0 se clear karo (is page ke) ----
    mov ecx, MAX_COINS_PER_PAGE
ClearLoop:
    mov byte ptr [coinOnArr + ebx], 0
    inc ebx
    loop ClearLoop

    ; wapas base index pe aao
    movzx ebx, currentCoinBase

    ; ---------- PAGE 0 COINS ----------
    movzx edx, currentPage
    cmp edx, 0
    jne NotPage0

    ; coin 0
    mov byte ptr [coinXArr + ebx], 15
    mov byte ptr [coinYArr + ebx], 45
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 1
    mov byte ptr [coinXArr + ebx], 40
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 2
    mov byte ptr [coinXArr + ebx], 65
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 3
    mov byte ptr [coinXArr + ebx], 100
    mov byte ptr [coinYArr + ebx], 44
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 4
    mov byte ptr [coinXArr + ebx], 75
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    jmp CoinsDone

; ---------- PAGE 1 COINS ----------
NotPage0:
    cmp edx, 1
    jne NotPage1

    ; page 1 ke 5 coins 
    ; coin 0
    mov byte ptr [coinXArr + ebx], 20
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 1
    mov byte ptr [coinXArr + ebx], 5
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 2
    mov byte ptr [coinXArr + ebx], 55
    mov byte ptr [coinYArr + ebx], 40
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 3
    mov byte ptr [coinXArr + ebx], 80
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 4
    mov byte ptr [coinXArr + ebx], 100
    mov byte ptr [coinYArr + ebx], 35
    mov byte ptr [coinOnArr + ebx], 1

    jmp CoinsDone

; ---------- PAGE 2 COINS ----------
NotPage1:
    ; page 2 ke 5 coins (example layout)
    ; coin 0
    mov byte ptr [coinXArr + ebx], 25
    mov byte ptr [coinYArr + ebx], 40
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 1
    mov byte ptr [coinXArr + ebx], 45
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 2
    mov byte ptr [coinXArr + ebx], 65
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 3
    mov byte ptr [coinXArr + ebx], 15
    mov byte ptr [coinYArr + ebx], 50
    mov byte ptr [coinOnArr + ebx], 1

    inc ebx
    ; coin 4
    mov byte ptr [coinXArr + ebx],  80
    mov byte ptr [coinYArr + ebx], 44
    mov byte ptr [coinOnArr + ebx], 1

CoinsDone:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
InitCoinsForPage ENDP


;-------------------------------------------------------------
; DrawMagnet - draws coin magnet power-up if active
; Uses magnetX, magnetY, magnetActive
;-------------------------------------------------------------
DrawMagnet PROC
    push eax
    push edx
    push ebx

    mov al, magnetActive
    cmp al, 1
    jne DoneMagnet

    ; color: bright cyan on blue
    mov eax, BLACK + (YELLOW * 16)
    call SetTextColor

    mov bl, magnetY
    mov bh, magnetX

    ; Row 1
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET magnetRow
    call WriteString

    ; reset color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

DoneMagnet:
    pop ebx
    pop edx
    pop eax
    ret
DrawMagnet ENDP

;-------------------------------------------------------------
; CheckMagnetCollision - if Mario touches magnet, activate it
;-------------------------------------------------------------
CheckMagnetCollision PROC
    push eax
    push ebx
    push ecx
    push edx

    ; agar magnet already inactive hai to skip
    mov al, magnetActive
    cmp al, 0
    je NoMagnetHit

    ; Mario box
    movzx eax, marioX          ; left
    movzx ebx, marioY          ; top
    mov ecx, eax
    add ecx, 2                 ; right
    mov edx, ebx
    add edx, 2                 ; bottom

    ; Magnet position
    movzx esi, magnetX
    movzx edi, magnetY

    ; Horizontal
    cmp esi, eax
    jl NoMagnetHit
    cmp esi, ecx
    jg NoMagnetHit

    ; Vertical
    cmp edi, ebx
    jl NoMagnetHit
    cmp edi, edx
    jg NoMagnetHit

    ; ---- collision: pick magnet ----
    INVOKE PlaySound, ADDR magnetOnSound, 0, SND_FILENAME OR SND_ASYNC
    mov magnetActive, 0          ; sprite hide
    mov coinMagnetActive, 1      ; effect ON
    mov coinMagnetTimer, 0       ; timer start at 0

NoMagnetHit:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckMagnetCollision ENDP



;---------------------------------------------------------
; CheckAllCoinsCollision - coins + magnet auto-collect
;   - Magnet ON: 3-block radius coins auto-collect
;   - Magnet OFF: normal 3x3 touch collect
;   - Per frame max 1 coin collect
;---------------------------------------------------------
CheckAllCoinsCollision PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; ---------- base index for this page ----------
    movzx esi, currentPage
    mov edx, MAX_COINS_PER_PAGE
    imul esi, edx              ; ESI = base index (0,5,10)

    mov edx, MAX_COINS_PER_PAGE ; EDX = loop counter

CoinLoop:
    ; coin already inactive?
    mov al, [coinOnArr + esi]
    cmp al, 0
    je NextCoin

    ; -------- Coin position --------
    movzx edi, [coinXArr + esi]   ; EDI = coinX
    movzx ecx, [coinYArr + esi]   ; ECX = coinY

    ;=====================================================
    ; MAGNET AUTO-COLLECT (agar ON hai)
    ;=====================================================
    cmp coinMagnetActive, 1
    jne CheckStrictTouch

    ; |coinX - marioX| <= 3 ?
    movzx eax, marioX
    mov ebx, edi              ; EBX = coinX
    sub ebx, eax              ; coinX - marioX
    jns MX_Pos
    neg ebx                   ; abs
MX_Pos:
    cmp ebx, 20
    jg CheckStrictTouch       ; bahar hai -> normal touch

    ; |coinY - marioY| <= 3 ?
    movzx eax, marioY
    mov ebx, ecx              ; EBX = coinY
    sub ebx, eax              ; coinY - marioY
    jns MY_Pos
    neg ebx
MY_Pos:
    cmp ebx, 20
    jg CheckStrictTouch       ; bahar hai -> normal touch

    ; ---- magnet auto-collect this coin ----
    mov byte ptr [coinOnArr + esi], 0   ; coin state off

    ; us position par blank draw karo (erase coin)
    mov dl, [coinXArr + esi]
    mov dh, [coinYArr + esi]
    mov eax, BLUE + (BLUE * 16)     ; pure blue background
    call SetTextColor
    call Gotoxy
    mov al, ' '                     ; ek space
    call WriteChar
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; SCORE +300
    mov eax, score
    add eax, 300
    mov score, eax

    ; COINS +1
    mov eax, coins
    add eax, 1
    mov coins, eax
    
    ; COIN SOUND
    INVOKE PlaySound, ADDR coinSound, 0, SND_FILENAME OR SND_ASYNC

    call DrawHUD
    jmp EndCoinCheck




    ;=====================================================
    ; NORMAL STRICT 3x3 TOUCH (magnet OFF ya bahar)
    ;=====================================================
CheckStrictTouch:
    ; Horizontal: coinX in [marioX, marioX+2]?
    movzx ebx, marioX          ; EBX = left
    mov eax, ebx
    add eax, 2                 ; EAX = right

    cmp edi, ebx               ; coinX < left ?
    jl NextCoin
    cmp edi, eax               ; coinX > right ?
    jg NextCoin

    ; Vertical: coinY in [marioY, marioY+2]?
    movzx ebx, marioY          ; EBX = top
    mov eax, ebx
    add eax, 2                 ; EAX = bottom

    cmp ecx, ebx               ; coinY < top ?
    jl NextCoin
    cmp ecx, eax               ; coinY > bottom ?
    jg NextCoin

    ; ---- collision: collect ONLY this coin ----
    mov byte ptr [coinOnArr + esi], 0   ; coin hide

    ; SCORE +300
    mov eax, score
    add eax, 300
    mov score, eax

    ; COINS +1
    mov eax, coins
    add eax, 1
    mov coins, eax

    ; COIN SOUND
    INVOKE PlaySound, ADDR coinSound, 0, SND_FILENAME OR SND_ASYNC

    call DrawHUD
    jmp EndCoinCheck          ; iss frame mein sirf 1 coin

NextCoin:
    inc esi                  ; next coin index (same page)
    dec edx                  ; ek coin kam
    jnz CoinLoop

EndCoinCheck:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckAllCoinsCollision ENDP



;-------------------------------------------------------------
; UpdateMagnet - handles magnet timer, HUD, and auto-collect flag
;   - 0 se start, 10 tak count, phir band
;-------------------------------------------------------------
UpdateMagnet PROC
    push eax
    push ebx
    push ecx
    push edx

    cmp coinMagnetActive, 1
    jne DoneMagnet

    ; -------- Timer --------
    mov eax, coinMagnetTimer
    inc eax
    mov coinMagnetTimer, eax

    ; secondsElapsed ? frames / 30
    mov ebx, 30
    mov edx, 0
    mov eax, coinMagnetTimer
    div ebx                     ; EAX = secondsElapsed (0,1,2,...)

    ; -------- Display value: 0..10 --------
    ; show secondsElapsed directly (0 se start)
    mov ecx, eax                ; ECX = secondsToShow

    ; -------- HUD: "MAGNET: X" --------
    mov eax, WHITE + (MAGENTA * 16)
    call SetTextColor

    mov dh, 37                  ; HUD row for magnet
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET magnetHudLbl
    call WriteString

    mov eax, ecx
    call WriteDec

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; -------- Duration end? (10 sec) --------
    ; jab secondsElapsed >= 10 ho jaye to effect OFF
    mov eax, coinMagnetTimer
    cmp eax, MAGNET_DURATION    ; MAGNET_DURATION = 300 (approx 10 sec)
    jl DoneMagnet

    ; time up ? effect OFF, next frame se HUD bhi nahi aayega
    mov coinMagnetActive, 0

DoneMagnet:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
UpdateMagnet ENDP

;---------------------------------------------------------
; EraseAllGoombas - clears previous 2x3 sprite area
;   - Uses goombaLastXArr / goombaLastYArr
;---------------------------------------------------------
EraseAllGoombas PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    movzx ecx, currentGoombaCount
    cmp ecx, 0
    je EAG_End

    movzx esi, currentGoombaBase

    mov eax, BLUE + (BLUE * 16)
    call SetTextColor

EAG_Loop:
    cmp ecx, 0
    jle EAG_End

    mov al, [goombaActiveArr + esi]
    cmp al, 1
    jne EAG_Next

    ; old position
    mov bl, [goombaLastXArr + esi]
    mov bh, [goombaLastYArr + esi]

    mov dl, bl
    mov dh, bh

    ; 2 rows, 3 cols
    mov edx, 2          ; rows
EAG_RowLoop:
    push edx
    call Gotoxy
    mov edx, 3          ; cols
EAG_SpaceLoop:
    mov al, ' '
    call WriteChar
    dec edx
    jnz EAG_SpaceLoop
    pop edx
    inc dh
    dec edx
    jnz EAG_RowLoop

EAG_Next:
    inc esi
    dec ecx
    jmp EAG_Loop

EAG_End:
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
EraseAllGoombas ENDP


;---------------------------------------------------------
; InitGoombasForPage - set 0..2 goombas per page
;---------------------------------------------------------
InitGoombasForPage PROC
    push eax
    push esi

    movzx eax, currentPage
    cmp eax, 0
    je InitPage0
    cmp eax, 1
    je InitPage1
    jmp InitPage2

; ---------- PAGE 0 ----------
InitPage0:
    mov currentGoombaBase, 0
    mov currentGoombaCount, 2      ; 2 enemies on page 0

    ; slot 0
    mov esi, 0
    mov BYTE PTR [goombaXArr + esi], 60
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], -1
    mov BYTE PTR [goombaActiveArr + esi], 1

    ; slot 1
    mov esi, 1
    mov BYTE PTR [goombaXArr + esi], 50
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], +1
    mov BYTE PTR [goombaActiveArr + esi], 1

    jmp InitDone

; ---------- PAGE 1 ----------
InitPage1:
    mov currentGoombaBase, 2
    mov currentGoombaCount, 2      ; 2 enemies on page 1

    ; slot 2
    mov esi, 2
    mov BYTE PTR [goombaXArr + esi], 60
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], -1
    mov BYTE PTR [goombaActiveArr + esi], 1

    ; slot 3
    mov esi, 3
    mov BYTE PTR [goombaXArr + esi], 5
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], +1
    mov BYTE PTR [goombaActiveArr + esi], 1

    jmp InitDone

; ---------- PAGE 2 ----------
InitPage2:
    mov currentGoombaBase, 4
    mov currentGoombaCount, 2      ; 2 enemies on page 2 (ya 0 karo agar nahi chahiye)

    ; slot 4
    mov esi, 4
    mov BYTE PTR [goombaXArr + esi], 50
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], -1
    mov BYTE PTR [goombaActiveArr + esi], 1

    ; slot 5
    mov esi, 5
    mov BYTE PTR [goombaXArr + esi], 35
    mov BYTE PTR [goombaYArr + esi], 58
    mov BYTE PTR [goombaDirArr + esi], +1
    mov BYTE PTR [goombaActiveArr + esi], 1

InitDone:
    pop esi
    pop eax
    ret
InitGoombasForPage ENDP



;-------------------------------------------------------------
; update gombas after colliding from walls, pipes or other objects
;-------------------------------------------------------------
UpdateAllGoombas PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    movzx ecx, currentGoombaCount
    cmp ecx, 0
    je UAG_End

    movzx esi, currentGoombaBase   ; 0,2,4

UAG_Loop:
    cmp ecx, 0
    jle UAG_End

    ; active?
    mov al, [goombaActiveArr + esi]
    cmp al, 1
    jne UAG_Next

    ; ---- speed control ----
    mov al, [goombaStepArr + esi]
    inc al
    mov [goombaStepArr + esi], al
    cmp al, GOOMBA_STEP_TICKS
    jl UAG_Next          ; abhi move nahi

    ; threshold reach -> reset counter, ab move karna hai
    mov BYTE PTR [goombaStepArr + esi], 0

    ; ---- last position save ----
    mov al, [goombaXArr + esi]
    mov [goombaLastXArr + esi], al
    mov al, [goombaYArr + esi]
    mov [goombaLastYArr + esi], al

    ; ---- movement (0..115) ----
    movzx eax, [goombaXArr + esi]
    movsx ebx, [goombaDirArr + esi]
    add eax, ebx          ; newX

    cmp eax, 0
    jl UAG_FlipR
    cmp eax, 115                        ; ? Screen width - sprite width
    jg UAG_FlipL

    mov [goombaXArr + esi], al
    
    ; ? CHECK PIPE COLLISION AFTER MOVE
    call CheckGoombaPipeCollision
    
    jmp UAG_Next

UAG_FlipR:
    mov BYTE PTR [goombaDirArr + esi], +1
    jmp UAG_Next

UAG_FlipL:
    mov BYTE PTR [goombaDirArr + esi], -1

UAG_Next:
    inc esi
    dec ecx
    jmp UAG_Loop

UAG_End:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
UpdateAllGoombas ENDP




;---------------------------------------------------------
; DrawAllGoombas - erase old pos with background, then draw new sprite
;---------------------------------------------------------
DrawAllGoombas PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    movzx ecx, currentGoombaCount
    cmp ecx, 0
    je DAG_End

    movzx esi, currentGoombaBase   ; 0,2,4

DAG_Loop:
    cmp ecx, 0
    jle DAG_End

    mov al, [goombaActiveArr + esi]
    cmp al, 1
    jne DAG_Next

    ; ---------- ERASE OLD (background blank 2x3) ----------
    mov bl, [goombaLastXArr + esi]
    mov bh, [goombaLastYArr + esi]

    mov eax, WHITE + (BLUE * 16)      ; same as background (sky)
    call SetTextColor

    mov dl, bl
    mov dh, bh

    ; row 1
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar

    ; row 2 (just under)
    inc dh
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar

    ; ---------- DRAW NEW SPRITE ----------
    mov bl, [goombaXArr + esi]
    mov bh, [goombaYArr + esi]

    mov eax, BROWN + (BLUE * 16)
    call SetTextColor

    ; row 1
    mov dl, bl
    mov dh, bh
    call Gotoxy
    mov edx, OFFSET goombaRow1
    call WriteString

    ; row 2
    mov dl, bl
    mov dh, bh
    inc dh
    call Gotoxy
    mov edx, OFFSET goombaRow2
    call WriteString

  
DAG_Next:
    inc esi
    dec ecx
    jmp DAG_Loop

DAG_End:
    ; ? REDRAW STATIC OBJECTS PER PAGE
    call RedrawNearbyObjects        ; This will handle all static elements

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DrawAllGoombas ENDP


;---------------------------------------------------------
; CheckGoombaPipeCollision - Goombas bounce off pipes
; We call this for each active goomba after moving
;---------------------------------------------------------
CheckGoombaPipeCollision PROC
    ; ESI = goomba index (already set by caller)
    push eax
    push ebx
    push ecx
    push edx

    ; Update current pipe bounds
    call UpdatePipeBounds

    ; Get Goomba bounds (2x3 sprite)
    movzx eax, [goombaXArr + esi]       ; Goomba left X
    mov ebx, eax
    add ebx, 2                          ; Goomba right X = X+2

    movzx ecx, [goombaYArr + esi]       ; Goomba top Y
    mov edx, ecx
    add edx, 1                          ; Goomba bottom Y = Y+1

    ; Check horizontal overlap with pipe
    movzx eax, currentPipeLeft
    cmp ebx, eax                        ; goomba right < pipe left?
    jl CGPC_NoColl
    
    movzx eax, currentPipeRight
    cmp BYTE PTR [goombaXArr + esi], al ; goomba left > pipe right?
    jg CGPC_NoColl

    ; Check vertical overlap (pipe rows 54-59)
    cmp edx, PIPE_TOP                   ; goomba bottom < pipe top?
    jl CGPC_NoColl
    cmp ecx, 59                         ; goomba top > pipe bottom?
    jg CGPC_NoColl

    ; COLLISION: Flip direction
    mov al, [goombaDirArr + esi]
    neg al
    mov [goombaDirArr + esi], al
    
    ; Rollback position to prevent stuck
    mov al, [goombaLastXArr + esi]
    mov [goombaXArr + esi], al

CGPC_NoColl:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckGoombaPipeCollision ENDP



;---------------------------------------------------------
; CheckAllGoombasCollision - WITH bounds safety
;   - STOMP: Mario upar se aaye -> Goomba dead + score
;   - BODY HIT: side/trail overlap -> Mario life-- + delay + respawn
;---------------------------------------------------------
CheckAllGoombasCollision PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    ; ---- SETUP ----
    movzx ecx, currentGoombaCount
    cmp ecx, 0
    je CAG_End                         ; no goombas active -> exit

    movzx esi, currentGoombaBase       ; start index (0, 2, 4 for page 0/1/2)

CAG_Loop:
    ; ---- BOUNDS CHECK (safety) ----
    cmp esi, TOTAL_GOOMBAS
    jge CAG_End                        ; esi out of bounds -> abort

    ; ---- Is this goomba active? ----
    mov al, [goombaActiveArr + esi]
    cmp al, 1
    jne CAG_Next                       ; inactive -> skip

    ; -------- X overlap: [marioX .. marioX+2] vs goombaX --------
    movzx eax, marioX
    mov ebx, eax
    add eax, 2                         ; Mario right = marioX+2

    movzx edx, [goombaXArr + esi]
    cmp edx, ebx                       ; goombaX < Mario left ?
    jl CAG_Next
    cmp edx, eax                       ; goombaX > Mario right ?
    jg CAG_Next

    ; -------- Y data --------
    movzx eax, marioY
    mov ebx, eax                       ; Mario top
    add eax, 2                         ; Mario bottom = marioY+2

    movzx edx, [goombaYArr + esi]      ; goombaY (top row)

    ; ---------- STOMP CHECK ----------
    ; If Mario bottom <= goombaY top, he landed on top -> stomp
    cmp eax, edx                       ; bottom <= goombaY ?
    jg CAG_SideHit                     ; Mario bottom inside/below goomba -> body hit

    ; ---------- STOMP: Goomba dead ----------
    mov BYTE PTR [goombaActiveArr + esi], 0

    mov eax, score
    add eax, 100
    mov score, eax
    call DrawHUD

    ; goomba death sound
    INVOKE PlaySound, ADDR enemydeathSound, 0, SND_FILENAME OR SND_ASYNC

    jmp CAG_Next                       ; Mario safe, no life loss

CAG_SideHit:
    ; BODY HIT: vertical overlap already hai, ab Mario damage

    ; ---- LIVES DECREMENT ----
    movzx eax, lives
    cmp eax, 0
    jle CAG_AfterLife
    dec eax
    mov lives, al

CAG_AfterLife:
    call DrawHUD

    ; ---- CHECK GAME OVER ----
    movzx eax, lives
    cmp eax, 0
    jne CAG_HitContinue

    mov gameOverActive, 1
    jmp CAG_End

CAG_HitContinue:
    ; hit dikhane ke liye chhota delay + respawn
    mov eax, 300
    call Delay

    INVOKE PlaySound, ADDR deathSound, 0, SND_FILENAME OR SND_ASYNC
    call EraseMario

    mov marioX, RESPAWN_X
    mov marioY, RESPAWN_Y
    mov lastMarioX, RESPAWN_X
    mov lastMarioY, RESPAWN_Y
    mov marioVelX, 0
    mov marioVelY, 0
    mov marioOnGround, 1

    call DrawHUD
    mov dh, marioY
    mov dl, marioX
    call DrawMario

CAG_Next:
    inc esi                            ; next goomba index
    dec ecx                            ; remaining goombas count
    cmp ecx, 0                         ; still more goombas to check?
    jg  CAG_Loop                       ; yes -> continue loop

CAG_End:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckAllGoombasCollision ENDP




;-----------------
; SaveHighScore 
;-----------------
SaveHighScore PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; ======== CLEAR BUFFER ========
    mov edi, OFFSET scoreLineBuffer
    mov ecx, 100
    xor al, al
ClearScoreLine:
    mov [edi], al
    inc edi
    loop ClearScoreLine

    ; ======== COPY PLAYER NAME ========
    mov esi, OFFSET currentPlayerName
    mov edi, OFFSET scoreLineBuffer
CopyNameToLine:
    mov al, [esi]
    cmp al, 0
    je NameCopied
    mov [edi], al
    inc esi
    inc edi
    jmp CopyNameToLine

NameCopied:
    ; Add " | "
    mov BYTE PTR [edi], ' '
    inc edi
    mov BYTE PTR [edi], '|'
    inc edi
    mov BYTE PTR [edi], ' '
    inc edi

    ; ======== CONVERT SCORE TO STRING ========
    mov ebx, edi                ; save current position

    mov eax, score
    mov esi, 10                 ; divisor
    xor ecx, ecx                ; digit counter

    ; Special case: score = 0
    cmp eax, 0
    jne ExtractDigits
    mov BYTE PTR [ebx], '0'
    inc ebx
    mov edi, ebx
    jmp ScoreDone

ExtractDigits:
    ; Push all digits
PushDigits:
    xor edx, edx
    div esi                     ; eax = eax/10, edx = remainder
    add dl, '0'                 ; convert digit to ASCII NOW
    push edx                    ; push ASCII digit
    inc ecx
    cmp eax, 0
    jne PushDigits

    ; Pop and write digits
    mov edi, ebx                ; restore buffer position
PopDigits:
    pop eax                     ; get ASCII digit
    mov [edi], al
    inc edi
    dec ecx                     ; manual decrement
    cmp ecx, 0
    jne PopDigits

ScoreDone:
    ; EDI now points after score

    ; Add " | "
    mov BYTE PTR [edi], ' '
    inc edi
    mov BYTE PTR [edi], '|'
    inc edi
    mov BYTE PTR [edi], ' '
    inc edi

    ; ======== COPY LEVEL ========
    mov esi, OFFSET worldVal
CopyLevel:
    mov al, [esi]
    cmp al, 0
    je LevelCopied
    mov [edi], al
    inc esi
    inc edi
    jmp CopyLevel

LevelCopied:
    ; Add CRLF
    mov BYTE PTR [edi], 0Dh
    inc edi
    mov BYTE PTR [edi], 0Ah
    inc edi
    mov BYTE PTR [edi], 0

    ; ======== OPEN FILE ========
    INVOKE CreateFileA,
        ADDR highScoreFileName,
        GENERIC_WRITE,
        FILE_SHARE_READ,
        0,
        OPEN_ALWAYS,
        0,
        0
    
    cmp eax, -1
    je SaveError
    mov fileHandle, eax

    ; ======== APPEND TO END ========
    INVOKE SetFilePointer,
        fileHandle,
        0,
        0,
        2

    ; ======== CALCULATE LENGTH ========
    mov esi, OFFSET scoreLineBuffer
    xor ecx, ecx
CalcLength:
    mov al, [esi]
    cmp al, 0
    je DoneLength
    inc ecx
    inc esi
    jmp CalcLength

DoneLength:
    ; ======== WRITE ========
    INVOKE WriteFile,
        fileHandle,
        ADDR scoreLineBuffer,
        ecx,
        ADDR bytesWritten,
        0

    ; ======== CLOSE ========
    INVOKE CloseHandle, fileHandle

SaveError:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
SaveHighScore ENDP


;-----------------
; LoadHighScores
;-----------------
LoadHighScores PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; ======== CLEAR ARRAYS ========
    mov edi, OFFSET topScoreNames
    mov ecx, 320
    xor al, al
ClearLoop1:
    mov [edi], al
    inc edi
    loop ClearLoop1

    mov edi, OFFSET topScores
    mov ecx, 10
    xor eax, eax
ClearLoop2:
    mov [edi], eax
    add edi, 4
    loop ClearLoop2

    mov edi, OFFSET topLevels
    mov ecx, 80
    xor al, al
ClearLoop3:
    mov [edi], al
    inc edi
    loop ClearLoop3

    ; ======== OPEN & READ FILE ========
    INVOKE CreateFileA,
        ADDR highScoreFileName,
        GENERIC_READ,
        FILE_SHARE_READ,
        0,
        3,
        0,
        0
    
    cmp eax, -1
    je LHS_Exit
    mov fileHandle, eax

    INVOKE ReadFile,
        fileHandle,
        ADDR tempBuffer,
        127,
        ADDR bytesRead,
        0

    INVOKE CloseHandle, fileHandle

    cmp bytesRead, 0
    je LHS_Exit

    ; Null terminate
    mov esi, OFFSET tempBuffer
    add esi, bytesRead
    mov BYTE PTR [esi], 0

    ; ======== PARSE EACH LINE ========
    mov esi, OFFSET tempBuffer
    xor ecx, ecx                    ; line counter

MainLoop:
    cmp ecx, 10
    jge LHS_Exit

    ; Check end
    mov al, [esi]
    cmp al, 0
    je LHS_Exit

    ; Skip CR/LF at start
SkipNewlines:
    mov al, [esi]
    cmp al, 0Dh
    je SkipChar
    cmp al, 0Ah
    je SkipChar
    cmp al, 0
    je LHS_Exit
    jmp ParseName

SkipChar:
    inc esi
    jmp SkipNewlines

    ; ==== PARSE NAME ====
ParseName:
    mov eax, ecx
    imul eax, 32
    lea edi, topScoreNames[eax]

CopyName:
    mov al, [esi]
    cmp al, 0
    je LHS_Exit
    cmp al, ' '
    je CheckPipe
    mov [edi], al
    inc esi
    inc edi
    jmp CopyName

CheckPipe:
    ; Check if next is '|'
    inc esi
    mov al, [esi]
    cmp al, '|'
    je NameDone
    ; If not, it was space in name
    dec edi
    jmp CopyName

NameDone:
    mov BYTE PTR [edi], 0
    inc esi                         ; skip '|'
    inc esi                         ; skip space after '|'

    ; ==== PARSE SCORE ====
    xor eax, eax
ParseScore:
    mov bl, [esi]
    cmp bl, '0'
    jb ScoreDone
    cmp bl, '9'
    ja ScoreDone
    
    imul eax, 10
    movzx edx, bl
    sub edx, '0'
    add eax, edx
    inc esi
    jmp ParseScore

ScoreDone:
    mov ebx, ecx
    imul ebx, 4
    lea edi, topScores[ebx]
    mov [edi], eax

    ; Skip " | "
    inc esi                         ; space
    inc esi                         ; |
    inc esi                         ; space

    ; ==== PARSE LEVEL ====
    mov eax, ecx
    imul eax, 8
    lea edi, topLevels[eax]

CopyLevel:
    mov al, [esi]
    cmp al, 0
    je LevelDone
    cmp al, 0Dh
    je LevelDone
    cmp al, 0Ah
    je LevelDone
    mov [edi], al
    inc esi
    inc edi
    jmp CopyLevel

LevelDone:
    mov BYTE PTR [edi], 0

    ; Skip to next line
SkipToNext:
    mov al, [esi]
    cmp al, 0
    je NextLine
    cmp al, 0Ah
    je FoundLF
    inc esi
    jmp SkipToNext

FoundLF:
    inc esi

NextLine:
    inc ecx
    jmp MainLoop

LHS_Exit:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
LoadHighScores ENDP


;-------------------
; DisplayHighScores 
;-------------------
DisplayHighScores PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; Load and sort
    call LoadHighScores
    call SortHighScores

    call Clrscr
    call DrawBlueBackground

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; ===== ASCII HEADING =====
    mov dh, 2
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores0
    call WriteString

    mov dh, 3
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores1
    call WriteString

    mov dh, 4
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores2
    call WriteString

    mov dh, 5
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores3
    call WriteString

    mov dh, 6
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores4
    call WriteString

    mov dh, 7
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores5
    call WriteString

    mov dh, 8
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores6
    call WriteString

    mov dh, 9
    mov dl, 9
    call Gotoxy
    mov edx, OFFSET highScores7
    call WriteString

    mov dh, 11
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator1
    call WriteString

    mov dh, 12
    mov dl, 4
    call Gotoxy
    mov edx, OFFSET Separator2
    call WriteString

    mov eax, BLACK + (WHITE * 16)
    call SetTextColor

    mov dh, 15
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET heading
    call WriteString

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    ; ===== DISPLAY ALL 10 SCORES =====
    mov ebx, 0                      

DisplayLoop:
    cmp ebx, 10
    jge DisplayDone

    ; ==== SET CURSOR POSITION ====
    movzx edx, bl
    add dl, 17                   ; row = 15 + index
    mov dh, dl
    mov dl, 30                      ; column = 30
    call Gotoxy

    ; ==== PRINT RANK ====
    mov eax, ebx
    inc eax
    cmp eax, 10
    jge TwoDigits
    
    mov al, ' '
    call WriteChar
    mov eax, ebx
    inc eax
    call WriteDec
    jmp AfterRank

TwoDigits:
    call WriteDec

AfterRank:
    mov al, '.'
    call WriteChar
    mov al, ' '
    call WriteChar

    ; ==== CHECK IF SLOT HAS DATA ====
    mov eax, ebx
    shl eax, 2
    lea esi, topScores[eax]
    mov eax, [esi]
    
    cmp eax, 0
    je EmptySlot

    ; ==== PRINT NAME ====
    mov eax, ebx
    shl eax, 5                      ; ebx * 32
    lea esi, topScoreNames[eax]
    mov edx, esi
    call WriteString

    mov al, ' '
    call WriteChar
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar

    ; ==== PRINT SCORE ====
    mov eax, ebx
    shl eax, 2
    lea esi, topScores[eax]
    mov eax, [esi]
    call WriteDec

    mov al, ' '
    call WriteChar
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar

    ; ==== PRINT LEVEL ====
    mov eax, ebx
    shl eax, 3                      ; ebx * 8
    lea esi, topLevels[eax]
    mov edx, esi
    call WriteString

    jmp NextEntry

EmptySlot:
    ; Print "---" for empty
    mov al, '-'
    call WriteChar
    call WriteChar
    call WriteChar

NextEntry:
    inc ebx                         ; next score
    jmp DisplayLoop

DisplayDone:
    ; Back message
    mov eax, WHITE + (RED * 16)
    call SetTextColor

    mov dh, 30
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET back
    call WriteString
    call ReadChar

    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DisplayHighScores ENDP



;---------------------------------------------------------
; SortHighScores - Bubble sort (descending by score)
;   Sorts topScores, topScoreNames, topLevels arrays
;---------------------------------------------------------
SortHighScores PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; Outer loop: 9 passes (0..8)
    mov ecx, 9

OuterLoop:
    push ecx                        ; save outer counter
    xor esi, esi                    ; index i = 0
    mov ecx, 9                      ; inner loop count

InnerLoop:
    ; Compare topScores[i] vs topScores[i+1]
    mov eax, esi
    shl eax, 2                      ; eax = i * 4
    lea edi, topScores
    add edi, eax
    
    mov ebx, [edi]                  ; score[i]
    mov edx, [edi+4]                ; score[i+1]
    
    cmp ebx, edx
    jge NoSwap                      ; if score[i] >= score[i+1], skip

    ; ===== SWAP SCORES =====
    mov [edi], edx
    mov [edi+4], ebx

    ; ===== SWAP NAMES (32 bytes) =====
    push esi
    push ecx
    
    mov eax, esi
    shl eax, 5                      ; eax = i * 32
    lea edi, topScoreNames
    add edi, eax                    ; edi = &names[i]
    
    lea esi, [edi+32]               ; esi = &names[i+1]
    
    mov ecx, 32
SwapNameLoop:
    mov al, [edi]
    mov bl, [esi]
    mov [edi], bl
    mov [esi], al
    inc edi
    inc esi
    loop SwapNameLoop
    
    pop ecx
    pop esi

    ; ===== SWAP LEVELS (8 bytes) =====
    push esi
    push ecx
    
    mov eax, esi
    shl eax, 3                      ; eax = i * 8
    lea edi, topLevels
    add edi, eax                    ; edi = &levels[i]
    lea esi, [edi+8]                ; esi = &levels[i+1]
    mov ecx, 8
SwapLevelLoop:
    mov al, [edi]                   
    mov bl, [esi]
    mov [edi], bl
    mov [esi], al
    inc edi
    inc esi
    loop SwapLevelLoop
    
    pop ecx
    pop esi

NoSwap:
    inc esi                         ; next index
    dec ecx                         ; inner loop counter
    jnz InnerLoop

    pop ecx                         ; restore outer counter
    loop OuterLoop

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
SortHighScores ENDP





;---------------------------------------------------------
; GetPlayerName - read full name into currentPlayerName
;---------------------------------------------------------
GetPlayerName PROC
    push eax
    push ecx
    push edx
    push esi
    push edi

    mov eax, BLACK + (WHITE * 16)
    call SetTextColor

    mov dh, 7
    mov dl, 55
    call Gotoxy
    mov edx, OFFSET enterNameMsg
    call WriteString

    ; Read full line into inputName (0-terminated)
    mov edx, OFFSET inputName
    mov ecx, 30              ; max 30 chars (safe)
    call ReadString          ; Irvine32

    ; Check if user entered anything
    cmp eax, 0
    jg  CopyPlayerName

    ; Empty input - use default "Player"
    mov esi, OFFSET inputName
    mov BYTE PTR [esi], 'P'
    mov BYTE PTR [esi+1], 'l'
    mov BYTE PTR [esi+2], 'a'
    mov BYTE PTR [esi+3], 'y'
    mov BYTE PTR [esi+4], 'e'
    mov BYTE PTR [esi+5], 'r'
    mov BYTE PTR [esi+6], 0

CopyPlayerName:
    ; Copy inputName ? currentPlayerName
    mov esi, OFFSET inputName
    mov edi, OFFSET currentPlayerName
    mov ecx, 31              ; max copy length

CopyNameLoop:
    mov al, [esi]
    mov [edi], al
    cmp al, 0
    je  CopyDone
    inc esi
    inc edi
    loop CopyNameLoop

CopyDone:
    mov BYTE PTR [edi], 0    ; Ensure null termination
    mov playerNameSet, 1
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edi
    pop esi
    pop edx
    pop ecx
    pop eax
    ret
GetPlayerName ENDP

;---------------------------------------------------------
; DrawCastle - Draws castle at DH=row, DL=col
;   Castle is 10 rows tall, ~45 chars wide
;   Input: DH = top row, DL = left column
;---------------------------------------------------------
DrawCastle PROC
     ; Parameters: 
    ; dh = starting row position
    ; dl = starting column position
    push eax
    push edx
    push ebx
    
    mov bl, dh    
    mov bh, dl
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    
    ; Row 1
    mov dh, bl              ; Use starting row
    mov dl, bh              ; Use starting column
    call Gotoxy
    mov edx, OFFSET castle1
    call WriteString
    
    ; Row 2
    inc bl                  ; Move to next row
    mov dh, bl
    mov dl, bh              ; Restore original dl from stack
    call Gotoxy
    mov edx, OFFSET castle2
    call WriteString
    
    ; Row 3
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle3
    call WriteString
    
    ; Row 4
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle4
    call WriteString
    
    ; Row 5
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle5
    call WriteString

    ; Row 6
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle6
    call WriteString

    ; Row 7
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle7
    call WriteString

    ; Row 8
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle8
    call WriteString

    ; Row 9
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle9
    call WriteString

    ; Row 10
    inc bl
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov edx, OFFSET castle10
    call WriteString

    pop ebx
    pop edx
    pop eax
    ret
DrawCastle ENDP


; ---------------------------------------------------------
; DrawCastleStaticElements
;   - Page-based castle environment for Boss level
;   - Uses currentPage = 0,1,2 exactly like DrawStaticElements
;   - Right now only CastlePage0Layout is unique; 1 and 2 reuse it.
; ---------------------------------------------------------
DrawCastleStaticElements PROC
    push eax
    push ebx
    push edx

    ; choose layout based on currentPage
    movzx eax, currentPage
    cmp eax, 0
    je  CastlePage0Layout
    cmp eax, 1
    je  CastlePage1Layout
    ; else assume page 2
    jmp CastlePage2Layout

; ---------- PAGE 0: main castle entrance + lava ----------
CastlePage0Layout:

    mov eax, LIGHTGRAY + (BLACK * 16)
    call SetTextColor
    mov dh, 54
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET castleBrickRow
    call WriteString

    ; maybe another brick row above
    mov dh, 55
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET castleBrickRow
    call WriteString

    ; lava at bottom row 59
    mov eax, YELLOW + (RED * 16)
    call SetTextColor
    mov dh, 59
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET castleLavaRow 
    call WriteString

    jmp CastleDrawGroundAndExit

; ---------- PAGE 1: yet not implemented ----------
CastlePage1Layout:
    jmp CastlePage0Layout

; ---------- PAGE 2: yet not implemented ----------
CastlePage2Layout:
    jmp CastlePage0Layout

CastleDrawGroundAndExit:
   
    call DrawlavaGround

    ; reset text color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edx
    pop ebx
    pop eax
    ret
DrawCastleStaticElements ENDP




; ---------------------------------------------------------
; RedrawCastleLevel
;   - Same idea as RedrawLevel but calls DrawCastleStaticElements
;   - Uses currentPage to pick which castle layout to draw.
; ---------------------------------------------------------
RedrawCastleLevel PROC
    push eax
    push edx

    mov skyLength, 40
    call DrawBlueBackground

    ; draw page-based castle layout instead of bushes/clouds/pipes
    call DrawCastleStaticElements

    ; draw Mario at current position
    mov dh, marioY
    mov dl, marioX
    call DrawMario

    pop edx
    pop eax
    ret
RedrawCastleLevel ENDP


; ---------------------------------------------------------
; BossLevel - Castle Level (Page 0 only for now)
;   - Reuses Level1-style loop: input -> physics -> collisions -> draw -> timer
;   - Castle environment drawn by DrawCastleStaticElements (page 0)
;   - Hazards: lava row + moving platform + rotating firebar
;   - Death: lava or firebar -> BossLoseLifeOrGameOver (respawn)
;   - ESC: exit back to main menu
; ---------------------------------------------------------
BossLevel PROC
    push eax
    push ebx
    push ecx
    push edx

; ------------ Initial state ------------
BossRestart:
    mov currentPage, 0           ; page 0 castle only 
    mov timeLeft, 300            ; boss level timer 
    mov frameCounter, 0

    ; Mario start position (on bridge over lava)
    mov marioX,  20
    mov marioY,  52              ; top row (feet ~54)
    mov lastMarioX, 20
    mov lastMarioY, 52
    mov marioVelX, 0
    mov marioVelY, 0
    mov marioOnGround, 1

    ; Moving platform initial state
    mov platformX, 30
    mov platformY, 52
    mov platformDir, 1

    ; Firebar initial state
    mov firebarPhase, 0

    ; ------------ First draw ------------
    mov skyLength, 60
    call Clrscr
    call DrawBlueBackground      ; same as Level1 sky
    call DrawCastleStaticElements ; castle page 0: bricks + lava, etc.
    call DrawHUD                  ; reuse same HUD (score, time, worldVal, lives)

    mov dh, marioY
    mov dl, marioX
    call DrawMario

; ------------ Main game loop ------------
BossGameLoop:
    ; small frame delay (similar to Level1 GameLoop)
    mov eax, 25
    call Delay

    ; remember last Mario position for EraseMario
    mov al, marioX
    mov lastMarioX, al
    mov al, marioY
    mov lastMarioY, al

    ; ---------- INPUT ----------
    call ReadKey
    jz  BL_NoKey                 ; no key pressed

    ; ESC -> exit level back to menu
    cmp al, 27
    je  BossExitLevel

    ; Pause
    cmp al, 'p'
    je  BL_Pause
    cmp al, 'P'
    je  BL_Pause

    ; Jump
    cmp al, 'w'
    je  BL_Jump
    cmp al, 'W'
    je  BL_Jump

    ; Move left
    cmp al, 'a'
    je  BL_Left
    cmp al, 'A'
    je  BL_Left

    ; Move right
    cmp al, 'd'
    je  BL_Right
    cmp al, 'D'
    je  BL_Right

    jmp BL_NoKey

; ----- Jump only from ground -----
BL_Jump:
    cmp marioOnGround, 1
    jne BL_NoKey
    mov marioVelY, -5
    mov marioOnGround, 0
    jmp BL_NoKey

; ----- Walk left -----
BL_Left:
    movzx eax, marioX
    cmp eax, 2
    jle BL_NoKey
    dec marioX
    ; (no pipe collision here; castle uses platform + lava)
    jmp BL_NoKey

; ----- Walk right -----
BL_Right:
    movzx eax, marioX
    cmp eax, 115
    jge BL_NoKey
    inc marioX
    jmp BL_NoKey

; ----- Pause menu -----
BL_Pause:
    call ShowPauseMenu           ; reuse existing pause proc
    ; ShowPauseMenu returns AL = 1 resume, 2 exit
    cmp al, 2
    je  BossExitLevel
    ; else resume game loop
    jmp BossGameLoop


; ---------- No input this frame ----------
BL_NoKey:
    ; ---------- PHYSICS ----------
    ; similar idea as ApplyPhysicsLevel1, but uses ApplyPhysicsBoss:
    ; gravity + landing on castle floor or moving platform
    call ApplyPhysicsBoss

    ; ---------- ERASE OLD SPRITES ----------
    call EraseMarioBoss              

    ; ---------- UPDATE WORLD / HAZARDS ----------
    call UpdateMovingPlatform    ; moves platformX left/right
    call UpdateFirebar           ; rotates and draws firebar arms

    ; ---------- COLLISIONS ----------
    call CheckLavaDeath          ; if feet at lava row, death / respawn
    call CheckFirebarHit         ; if overlapping firebar square, death / respawn

    ; ---------- DRAW NEW FRAME ----------
    ; redraw static castle background (page 0)
    call DrawCastleStaticElements

    ; draw Mario at new position
    mov dh, marioY
    mov dl, marioX
    call DrawMario

    ; HUD timer (same style as Level1)
    inc frameCounter
    mov eax, frameCounter
    cmp eax, 10
    jl  BL_SkipTimer
    mov frameCounter, 0
    mov eax, timeLeft
    cmp eax, 0
    jle BL_SkipTimer
    dec eax
    mov timeLeft, eax
    call DrawHUD
BL_SkipTimer:

    jmp BossGameLoop

; ==== SAVE HIGH SCORE BEFORE EXIT ====
    call SaveHighScore

; ------------ Exit from boss level ------------
BossExitLevel:
    mov lives, 3
    mov timeLeft, 400
    mov score, 0
    mov coins, 0

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
BossLevel ENDP


; ---------------------------------------------------------
; ApplyPhysicsBoss - gravity + ground/platform for boss page 0
;   - Uses GRAVITY, MAXFALLSPEED, GROUNDY
;   - Ground feet row = GROUNDY (59), top = GROUNDY - 2 (57)
;   - Platform at (platformX..platformX+4, platformY)
; ---------------------------------------------------------
ApplyPhysicsBoss PROC
    push eax
    push ebx
    push edx

    cmp marioOnGround, 1
    je  APB_Done

    ; ----- gravity -----
    mov eax, marioVelY
    add eax, GRAVITY
    cmp eax, MAX_FALL_SPEED
    jle APB_StoreFall
    mov eax, MAX_FALL_SPEED
APB_StoreFall:
    mov marioVelY, eax

    ; candidate new top row
    movzx ebx, marioY
    add ebx, eax          ; EBX = newYtop

    ; ----- platform landing -----
    mov edx, ebx
    add edx, 2            ; candidate feet row
    movzx eax, platformY
    cmp edx, eax
    jne APB_CheckGround

    ; X overlap with platform (5 chars)
    movzx eax, marioX
    mov ecx, eax
    add ecx, 2            ; Mario right
    movzx edx, platformX
    mov esi, edx
    add esi, 4            ; platform right

    cmp ecx, edx          ; Mario right < platform left?
    jl  APB_CheckGround
    cmp eax, esi          ; Mario left > platform right?
    jg  APB_CheckGround

    ; landed on moving platform
    movzx ebx, platformY
    sub ebx, 2            ; Mario top row
    mov marioVelY, 0
    mov marioOnGround, 1
    jmp APB_SaveY

APB_CheckGround:
    ; ----- stone ground at GROUNDY -----
    mov edx, ebx
    add edx, 2            ; candidate feet
    cmp edx, GROUND_Y
    jl  APB_SaveY
    mov ebx, GROUND_Y - 2  ; Mario top row
    mov marioVelY, 0
    mov marioOnGround, 1

APB_SaveY:
    mov marioY, bl

APB_Done:
    pop edx
    pop ebx
    pop eax
    ret
ApplyPhysicsBoss ENDP



; ---------------------------------------------------------
; UpdateMovingPlatform - simple left/right between 25..90
; ---------------------------------------------------------
UpdateMovingPlatform PROC
    push eax
    push ebx

    movsx eax, platformDir
    movzx ebx, platformX
    add ebx, eax

    cmp ebx, 25
    jl  UMP_FlipRight
    cmp ebx, 90
    jg  UMP_FlipLeft
    mov platformX, bl
    jmp UMP_Done

UMP_FlipRight:
    mov platformDir, 1
    mov platformX, 25
    jmp UMP_Done

UMP_FlipLeft:
    mov platformDir, -1
    mov platformX, 90

UMP_Done:
    pop ebx
    pop eax
    ret
UpdateMovingPlatform ENDP



; ---------------------------------------------------------
; UpdateFirebar - rotate and draw firebar arms
;   firebarPhase: 0 = horizontal, 1 = vertical, 2 = diag /, 3 = diag \
; ---------------------------------------------------------
UpdateFirebar PROC
    push eax
    push ebx
    push edx

    ; advance phase 0..3
    mov al, firebarPhase
    inc al
    and al, 3
    mov firebarPhase, al

    ; clear small 5x5 area around center
    mov eax, BLUE + (BLUE * 16)
    call SetTextColor
    mov bl, FIREBAR_CENTER_Y
    sub bl, 2
    mov bh, FIREBAR_CENTER_X
    sub bh, 2
    mov edx, 5
UF_ClearRow:
    push edx
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov ecx, 5
UF_ClearCol:
    mov al, ' '
    call WriteChar
    loop UF_ClearCol
    inc bl
    pop edx
    dec edx
    jnz UF_ClearRow

    ; draw new arms
    mov eax, RED + (BLUE * 16)
    call SetTextColor

    mov al, firebarPhase
    cmp al, 0
    je  UF_Horiz
    cmp al, 1
    je  UF_Vert
    cmp al, 2
    je  UF_Diag1
    jmp UF_Diag2

UF_Horiz:
    mov dh, FIREBAR_CENTER_Y
    mov dl, FIREBAR_CENTER_X
    sub dl, 3
    mov ecx, 7
UF_HLoop:
    call Gotoxy
    mov al, '*'
    call WriteChar
    inc dl
    loop UF_HLoop
    jmp UF_DoneDraw

UF_Vert:
    mov dh, FIREBAR_CENTER_Y
    sub dh, 3
    mov dl, FIREBAR_CENTER_X
    mov ecx, 7
UF_VLoop:
    call Gotoxy
    mov al, '*'
    call WriteChar
    inc dh
    loop UF_VLoop
    jmp UF_DoneDraw

UF_Diag1:
    mov dh, FIREBAR_CENTER_Y
    sub dh, 3
    mov dl, FIREBAR_CENTER_X
    add dl, 3
    mov ecx, 7
UF_D1Loop:
    call Gotoxy
    mov al, '*'
    call WriteChar
    inc dh
    dec dl
    loop UF_D1Loop
    jmp UF_DoneDraw

UF_Diag2:
    mov dh, FIREBAR_CENTER_Y
    sub dh, 3
    mov dl, FIREBAR_CENTER_X
    sub dl, 3
    mov ecx, 7
UF_D2Loop:
    call Gotoxy
    mov al, '*'
    call WriteChar
    inc dh
    inc dl
    loop UF_D2Loop

UF_DoneDraw:
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edx
    pop ebx
    pop eax
    ret
UpdateFirebar ENDP


; ---------------------------------------------------------
; CheckLavaDeath - if Mario feet in lava row (59) -> respawn
; ---------------------------------------------------------
CheckLavaDeath PROC
    push eax

    movzx eax, marioY
    add eax, 2           ; feet row
    cmp eax, 59
    jl  CLD_Safe

    ; fell into lava -> death / respawn
    call BossLoseLifeOrGameOver

CLD_Safe:
    pop eax
    ret
CheckLavaDeath ENDP



; ---------------------------------------------------------
; CheckFirebarHit - AABB vs square around firebar
;   Mario is 3x3: (marioX .. marioX+2, marioY .. marioY+2)
;   Firebar square: center +/- 3 in X and Y
; ---------------------------------------------------------
CheckFirebarHit PROC
    push eax
    push ebx
    push edx

    ; X overlap
    movzx eax, marioX
    mov ebx, eax
    add ebx, 2           ; Mario right

    mov edx, FIREBAR_CENTER_X
    sub edx, 3           ; left bound
    cmp ebx, edx
    jl  CFH_Safe

    mov edx, FIREBAR_CENTER_X
    add edx, 3           ; right bound
    cmp eax, edx
    jg  CFH_Safe

    ; Y overlap
    movzx eax, marioY
    mov ebx, eax
    add ebx, 2           ; bottom

    mov edx, FIREBAR_CENTER_Y
    sub edx, 3           ; top bound
    cmp ebx, edx
    jl  CFH_Safe

    mov edx, FIREBAR_CENTER_Y
    add edx, 3           ; bottom bound
    cmp eax, edx
    jg  CFH_Safe

    ; inside firebar area
    call BossLoseLifeOrGameOver

CFH_Safe:
    pop edx
    pop ebx
    pop eax
    ret
CheckFirebarHit ENDP



; Boss-level erase: clear a slightly bigger box (6x4) to remove trails
EraseMarioBoss PROC
    push eax
    push ebx
    push ecx
    push edx

    ; blue background (castle sky)
    mov eax, BLUE + (BLUE * 16)
    call SetTextColor

    movzx ebx, lastMarioY    ; starting row (top of old Mario)
    mov ecx, 4              

EMB_RowLoop:
    mov dh, bl
    mov dl, lastMarioX       ; start from old X
    call Gotoxy

    push ecx
    mov ecx, 6               
EMB_ColLoop:
    mov al, ' '
    call WriteChar
    loop EMB_ColLoop
    pop ecx

    inc bl
    loop EMB_RowLoop

    ; reset color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
EraseMarioBoss ENDP



; ---------------------------------------------------------
; BossLoseLifeOrGameOver
;   - Plays death sound
;   - Decrements lives (but not below 0)
;   - Respawns Mario on boss page 0 bridge
; ---------------------------------------------------------
BossLoseLifeOrGameOver PROC
    push eax

    ; death sound
    INVOKE PlaySound, ADDR deathSound, 0, SND_FILENAME OR SND_ASYNC
    mov eax, 300
    call Delay

    ; ---- LIVES -- decrement ----
    mov al, lives
    cmp al, 0
    jle BL_NoLifeChange       
    dec al
    mov lives, al
BL_NoLifeChange:

    ; ---- RESPawn mario on boss bridge ----
    mov marioX, 20
    mov marioY, 52            ; boss page 0 start top row (feet ~54/55)
    mov lastMarioX, 20
    mov lastMarioY, 52
    mov marioVelX, 0
    mov marioVelY, 0
    mov marioOnGround, 1

    pop eax
    ret
BossLoseLifeOrGameOver ENDP


;---------------------------------------------------------
; Drawlava - Draws lava at bottom of screen
;---------------------------------------------------------

DrawlavaGround PROC
    push eax
    push edx
    push ecx
    
    ; Set ground color
    mov eax, RED + (RED * 16)
    call SetTextColor
    
    mov ecx, 5       ; Number of rows to fill
    mov dh, 60       ; Starting row (after blue sky)
    mov dl, 0        ; Start from left edge
    call Gotoxy
    
FillGreenLoop:
    push ecx
    mov edx, OFFSET ground
    call WriteString
    inc dh              ; Move to next row
    pop ecx
    loop FillGreenLoop
    
    ; Reset color
    mov eax, WHITE + (BLUE * 16)
    call SetTextColor
    
    pop ecx
    pop edx
    pop eax
    ret
DrawlavaGround ENDP



END main