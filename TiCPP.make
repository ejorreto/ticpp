# C++ Static Library Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=Debug
endif

ifeq ($(CONFIG),Debug)
  BINDIR := .
  LIBDIR := ../lib
  OBJDIR := .objsd
  OUTDIR := ../lib
  CPPFLAGS := -MMD -D "TIXML_USE_TICPP" -D "WIN32" -D "_WINDOWS" -D "DEBUG" -D "_DEBUG" -I "../tinyxml"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g -Wall -O0
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -l
  LDDEPS :=
  RESFLAGS := -D "TIXML_USE_TICPP" -D "WIN32" -D "_WINDOWS" -D "DEBUG" -D "_DEBUG" -I "../tinyxml"
  TARGET := libticppd.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),Release)
  BINDIR := .
  LIBDIR := ../lib
  OBJDIR := .objs
  OUTDIR := ../lib
  CPPFLAGS := -MMD -D "TIXML_USE_TICPP" -D "WIN32" -D "_WINDOWS" -D "NDEBUG" -I "../tinyxml"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O3 -Wall
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -s -l
  LDDEPS :=
  RESFLAGS := -D "TIXML_USE_TICPP" -D "WIN32" -D "_WINDOWS" -D "NDEBUG" -I "../tinyxml"
  TARGET := libticpp.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/ticpp.o \
	$(OBJDIR)/tinystr.o \
	$(OBJDIR)/tinyxml.o \
	$(OBJDIR)/tinyxmlerror.o \
	$(OBJDIR)/tinyxmlparser.o \

RESOURCES := \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin/sh.exe,$(SHELL))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking TiCPP
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning TiCPP
ifeq ($(MKDIR_TYPE),posix)
	-@rm -rf $(OUTDIR)/$(TARGET) $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/ticpp.o: ticpp.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/tinystr.o: tinystr.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/tinyxml.o: tinyxml.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/tinyxmlerror.o: tinyxmlerror.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/tinyxmlparser.o: tinyxmlparser.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)
