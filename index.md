---
layout: default
---

# FHI-aims Tutorials

The following incorporates the input files and results obtained from FHI-aims tutorials. The lecture videos and slides used during the tutorials are given here: [https://indico.fhi-berlin.mpg.de/event/112/](https://indico.fhi-berlin.mpg.de/event/112/)

Resources for plotting: Clims, GIMS, python3

***
# TUTORIAL1: Basics of Electron Structure Theory
The aims calculations is run using the command: mpirun -n N aims.x | tee aims.out

## 1.1. Spin Unpolarised Simulations:
Structure optimisation of H2O molecule without the effect of spin:

### 1.1.1. Structure relaxation of an unphysical H20 molecule

**Input:**<br/> 
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/geometry.in) (The bonds are at a bond angle of 90 degree)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/control.in) (PBE, appended with light species defaults of H and O)
**Highlight:** Keywords in control.in:<br/> 
**xc** - which exchange-correlation functional is used (*PBE*, here)  relativistic - which approximation is used to include relativistic effects (*atomic_zora* (scalar))<br/>
**relax_geometry** - which algorithm is used for geometry optimisation (*bfgs*). The number beside defines the threshold of accuracy. (*5e-3*)<br/>
**spin** - whether spin is being considered (*none*)<br/>
**Highlight:** Species Defaults:<br/>
The basis sets are modified for each atomic species for optimal performance. These values are divided into different tiers depending on accuracy/efficiency. These are already present in the FHI-aims directory and are added to the control.in. (Here, light defaults are added of H and O)

**Output:**<br/> 
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/aims.out) (Contains all information of the system)<br/>
[geometry.in.next_step](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/geometry.in.next_step) (Geometry of the final relaxed structure)<br/>
[hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/hessian.aims) (contains hessian of previous calculations, used in further convergence of relaxed structure)

**Point of Interest:** Final total energy delivered by the s.c.f. cycle; Final geometry reached by the geometry optimization.

### 1.1.2. Restarting structure relaxation using output from previous relaxations

**Input:**<br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/geometry.in) (geometry.in.next_step from earlier output)<br/>
[hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/hessian.aims) (from earlier output, keyword hessian indicates that hessian.aims will be provided with geometry.in)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/control.in) (HSE, intermediate H, O)<br/>
**Highlight:** Keywords in control.in:<br/>
xc - hse06 0.11 : <br/>
**hse_unit** - bohr : <br/>
**Highlight:** Keywords in geometry.in file:<br/>
**trust_radius** - <br/>
**hessian_file** - Indicates that hessian.aims is present for this geometry <br/>

**Output:**<br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/aims.out)<br/>
 \+ usual *(Only files important to this tutorial are mentioned)*

**Point of Interest:** "Computational Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps

### 1.1.3. Structure relaxation of H2O molecule using HSE
This is done to highlight the computational advantage of relaxing a pre-relaxed structure with light settings over starting the relaxation from scratch for a more accurate system (HSE > PBE)

**Input:** <br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/geometry.in)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/control.in) (HSE, intermediate H,O)<br/>

**Output:** <br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/aims.out)<br/>
/+ usual 

**Point of Interest:** "Computational Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps (Compare between earlier output and here)  

## 1.2. Spin Polarised Simulations:
Structure relaxation of an O2 molecule considering spin.

**Input:**<br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/geometry.in)<br/>
**Highlight:** Keywords in geometry.in<br/>
**initial moment** - how many exceeding spin up electrons (*1.0*, here)<br/>
**initial charge** - if our atom is ionised or has extra electrons (*0.0*, here)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/control.in)<br/>
**Highlight:** Keyword in control.in<br/>
spin - To indicate that this is a spin polarised system (***collinear***)<br/>

**Output:**<br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/aims.out)<br/>
/+ usual

**Point of Interest:** "Current spin moment of the entire structure". Check if total spin moment of O molecule is 2.

## 1.3. Periodic Systems:



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
