#ifndef SCREEN_H_
#define SCREEN_H_

#include <feta.h>
#include <boot/uefi.h>

void screen_init();

void screen_terminal_clear();
void screen_terminal_setForegroundColor(UINTN color);
void screen_terminal_resetForegroundColor();
void screen_terminal_setBackgroundColor(UINTN color);
void screen_terminal_resetBackgroundColor();
void screen_terminal_writeString(String data);
void screen_terminal_writeString(strchar data);

uinteger screen_terminal_cursorColumn();
uinteger screen_terminal_cursorRow();
void screen_terminal_setCursorColumn(uinteger column);
void screen_terminal_setCursorRow(uinteger row);

void screen_graphics_rectangle(uint32 x, uint32 y, uint32 width, uint32 height,	uint8 red, uint8 green, uint8 blue);
void screen_graphics_pixel(uint32 x, uint32 y, uint8 red, uint8 green,	uint8 blue);
void screen_graphics_flip();

void screen_graphicsMode();

#endif /* SCREEN_H_ */
