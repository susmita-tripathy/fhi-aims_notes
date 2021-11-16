---
layout: default
---

# FHI-aims Tutorials

The following incorporates the input files and results obtained from FHI-aims tutorials. The lecture videos and slides used during the tutorials are given here: [https://indico.fhi-berlin.mpg.de/event/112/](https://indico.fhi-berlin.mpg.de/event/112/)

Resources for plotting: Clims, GIMS, python3

***
# TUTORIAL1: Basics of Electron Structure Theory
The aims calculations is run using the command: mpirun -n N aims.x | tee aims.out

## Spin Unpolarised Simulations:
Relaxation of H2O molecule without the effect of spin:

Input: [geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/geometry.in), [control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/control.in) (PBE, appended with light species defaults of H and O)

Output: [aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/aims.out) (Contains all information of the system) [geometry.in.next_step](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/geometry.in.next_step) (Geometry of the final relaxed structure), [hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/hessian.aims) (contains hessian of previous calculations, used in further convergence of relaxed structure)

Point of Interest: Final total energy delivered by the s.c.f. cycle; Final geometry reached by the geometry optimization.

### Restarting structure relaxation using output from previous relaxations
Input: [geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/geometry.in) (geometry.in.next_step from earlier output), [hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/hessian.aims) (from earlier output, keyword hessian indicates that hessian.aims will be provided with geometry.in), [control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/control.in) (HSE, intermediate H, O)

Output: [aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/aims.out)

Point of Interest: "Computaional Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps

### Structure relaxation of H2O molecule using HSE
This is done to highlight the computational advantage of relaxing a pre-relaxed structure with light settings over starting the relaxation from scratch for a more accurate system (HSE > PBE)

Input: [geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/geometry.in), [control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/control.in) (HSE, intermediate H,O)

Output: [aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/aims.out)

Point of Interest: "Computaional Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps (Compare between earlier output and here)  

## Spin Polarised Simulations:



## Periodic Systems:



Unzip the files in linux as
```
bunzip2 -f 77k_BODIPYs_properties.txt.bz2
bunzip2 -f 77k_BODIPYs_DFT_geom.xyz.bz2
bunzip2 -f 77k_BODIPYs_PM7_geom.xyz.bz2
```

***

## Files
### 77k_BODIPYs_DFT_geom.xyz 

Contains coordinates of 77412 BODIPYs relaxed at B3LYP/def2-SVP level.

***

### 77k_BODIPYs_PM7_geom.xyz 

Contains coordinates of 77412 BODIPYs relaxed using PM7.

***

### 77k_BODIPYs_properties.txt 

Contains properties of 77412 BODIPYs, calculated at RIJCOSX-CAM-B3LYP/def2-TZVP level as described below

**Column 01** names of the molecules made up using site (s_nn) and type of substitution (g_mm)

```
Example: g_01_s_7_00002 implies there is a substitution at site 7 by group 01. 
The last digits (here _00002) are for indexing and can be ignored.  
Long names (Hextuply/Septuply-substituted) do not contain '_'.
```

**Column 02** T/V in training/validation set in ML       
**Column 03** State index (always 1)    
**Column 04** S<sub>0</sub>  → S<sub>1</sub>  Excitation energy (in cm<sup>-1</sup>)    
**Column 05** S<sub>0</sub>  → S<sub>1</sub>  Excitation energy (in nm)     
**Column 06** S<sub>0</sub>  → S<sub>1</sub>  Excitation energy (in au)     
**Column 07** S<sub>0</sub>  → S<sub>1</sub>  Excitation energy (in eV)     
**Column 08** Oscillator strength of S<sub>0</sub>  → S<sub>1</sub>  excitation     
**Column 09** T<sup>2</sup> (in au<sup>2</sup>), square of transition dipole moment     
**Column 10** TX (in au), x-component of transition dipole moment vector     
**Column 11** TY (in au), y-component of transition dipole moment vector     
**Column 12** TZ (in au), z-component of transition dipole moment vector      
**Column 13** DFT Ground State energy (in au)      
**Column 14** PM7 HOMO (in eV)       
**Column 15** PM7 LUMO (in eV)       
**Column 16** PM7 heat of formation (in kcal/mol)      

***

## Dataset breakdown

| **Type**                 | **# entries**
| Unsubstituted            | 1       
| Singly-substituted       | 184      
| Doubly-substituted       | 22287     
| Triply-substituted       | 10999     
| Quadruply-substituted    | 10990     
| Quintuply-substituted    | 10982     
| Hextuply-substituted     | 10986     
| Septuply-substituted     | 10983     

## Related resources

#### Machine for S<sub>0</sub>  → S<sub>1</sub>  excitation energy of BODIPYs
[https://moldis.tifrh.res.in/db/bodipy](https://moldis.tifrh.res.in/db/bodipy)

#### Codes for inverse-designing BODIPYs
[https://github.com/moldis-group/bodipy](https://github.com/moldis-group/bodipy)

***

## Revision notes

_19 August 2021: First upload_

***

## References
[Ref-1] [_Data-driven modeling of S<sub>0</sub>  → S<sub>1</sub> transition in the Chemical Space of BODIPYs: High-throughput computation, chemical trends and
machine learning guided design_](https://arxiv.org/pdf/2110.05414)            
Amit Gupta, Sabyasachi Chakraborty, Debashree Ghosh and Raghunathan Ramakrishnan     
submitted (2021)    

Dataset: https://doi.org/10.6084/m9.figshare.16529214.v1

***
