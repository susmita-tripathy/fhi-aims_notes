
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
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/control.in) (PBE, appended with light species defaults of H and O)<br/>
**Highlight:** Keywords in control.in:<br/> 
*xc* - exchange-correlation functional used (*PBE*, here)<br/>
*relativistic* - approximation used to include relativistic effects (*atomic_zora* (scalar))<br/>
*relax_geometry* - algorithm used for geometry optimisation (*bfgs*). The number beside defines the threshold of accuracy. (*5e-3*)<br/>
*spin* - whether spin is being considered (*none*)<br/>
**Highlight:** Species Defaults:<br/>
The basis sets are modified for each atomic species for optimal performance. These values are divided into different tiers depending on accuracy/efficiency. These are already present in the FHI-aims directory and are added to the control.in. (Here, *light* defaults are added of *H* and *O*)

**Output:**<br/> 
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/aims.out) (Contains all information of the system and details of convergence cycles)<br/>
[geometry.in.next_step](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/geometry.in.next_step) (Geometry of the final relaxed structure)<br/>
[hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O/hessian.aims) (contains hessian of previous calculations, used in further convergence of relaxed structure)

**Point of Interest:** Final total energy delivered by the s.c.f. cycle; Final geometry reached by the geometry optimization.

### 1.1.2. Restarting structure relaxation using output from previous relaxations

**Input:**<br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/geometry.in) (geometry.in.next_step from earlier output)<br/>
[hessian.aims](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/hessian.aims) (from earlier output, keyword hessian indicates that hessian.aims will be provided with geometry.in)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/control.in) (HSE, intermediate H, O)<br/>
**Highlight:** Keywords in geometry.in file:<br/>
*trust_radius* - Threshold from bfgs algorithm<br/>
*hessian_file* - Indicates that hessian.aims is present for this geometry <br/>
**Highlight:** Keywords in control.in:<br/>
xc - *hse06 0.11* : exchange correlation used <br/> 
*hse_unit* - bohr : <br/>

**Output:**<br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_2/aims.out)<br/>
+ usual *(Only files important to this tutorial are mentioned)*

**Point of Interest:** "Computational Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps

### 1.1.3. Structure relaxation of H2O molecule using HSE
This is done to highlight the computational advantage of relaxing a pre-relaxed structure with light settings over starting the relaxation from scratch for a more accurate system (HSE > PBE)

**Input:** <br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/geometry.in)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/control.in) (HSE, intermediate H,O)<br/>

**Output:** <br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/tree/main/H2O_3/aims.out)<br/>
+ usual 

**Point of Interest:** "Computational Steps:" Number of self-consistency cycles; Number of SCF (re)initializations; Number of relaxation steps (Compare between earlier output and here)  

## 1.2. Spin Polarised Simulations:
Structure relaxation of an O2 molecule considering spin.

**Input:**<br/>
[geometry.in](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/geometry.in)<br/>
[control.in](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/control.in)<br/>
**Highlight:** Keywords in geometry.in<br/>
*initial moment* - how many exceeding spin up electrons (*1.0*, here)<br/>
*initial charge* - if our atom is ionised or has extra electrons (*0.0*, here)<br/>
**Highlight:** Keyword in control.in<br/>
spin - To indicate that this is a spin polarised system (*collinear*)<br/>

**Output:**<br/>
[aims.out](https://github.com/susmita-tripathy/fhi-aims_notes/blob/main/O2/aims.out)<br/>
+ usual

**Point of Interest:** "Current spin moment of the entire structure". Check if total spin moment of O molecule is 2.

## 1.3. Periodic Systems:
Calculations in periodic systems.

### 1.3.1. 
Periodic Structure Relaxation of Si

**Input:**<br/>
[geometry.in]()




***


