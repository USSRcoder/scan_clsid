@rem php needed for merging 
@rem rg.exe need for scan - ripgrep 14.1.1 (rev 4649aa9700) Project home page: https://github.com/BurntSushi/ripgrep

@echo grep, notepad++, findstr, tcmd, altap salamander, far, edit+ - can't search unicode and ascii pattern at the same time;
@echo so we scan 2 times, with ripgrep, and merging results

@rem .inf?? .xrm-ms? .xml?
@echo scan files with ext : *.exe *.dll *.acm *.ax *.com *.cpl *.drv *.dgml *.iec *.ime *.mof *.msc *.ocx *.rll *.rs *.scr *.sys *.ppkg *.prx *.tlb *.tsp *.vdm

@echo.
@echo scan UUID in ASCII
rg -Eascii -aoNH --type-add "src:*.exe" --type-add "src:*.dll" --type-add "src:*.acm" --type-add "src:*.ax" --type-add "src:*.com" --type-add "src:*.cpl" --type-add "src:*.drv" --type-add "src:*.dgml" --type-add "src:*.iec" --type-add "src:*.ime" --type-add "src:*.mof" --type-add "src:*.msc" --type-add "src:*.ocx" --type-add "src:*.rll" --type-add "src:*.rs" --type-add "src:*.scr" --type-add "src:*.sys" --type-add "src:*.ppkg" --type-add "src:*.prx" --type-add "src:*.tlb" --type-add "src:*.tsp" --type-add "src:*.vdm" -tsrc "[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]" c:\windows\ > clsid_ascii.txt

@echo scan UUID in UCS
rg -Eutf-16 -aoNH --type-add "src:*.exe" --type-add "src:*.dll" --type-add "src:*.acm" --type-add "src:*.ax" --type-add "src:*.com" --type-add "src:*.cpl" --type-add "src:*.drv" --type-add "src:*.dgml" --type-add "src:*.iec" --type-add "src:*.ime" --type-add "src:*.mof" --type-add "src:*.msc" --type-add "src:*.ocx" --type-add "src:*.rll" --type-add "src:*.rs" --type-add "src:*.scr" --type-add "src:*.sys" --type-add "src:*.ppkg" --type-add "src:*.prx" --type-add "src:*.tlb" --type-add "src:*.tsp" --type-add "src:*.vdm" -tsrc "[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]-[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]" c:\windows\ > clsid_unicode.txt

@echo.
@echo It's faster to write a merge in PHP than to look for another buggy merger.
@echo.
@echo merging UUID
c:\Old\php\php.exe merge.php > clsid_merged.txt
