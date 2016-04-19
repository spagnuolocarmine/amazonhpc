# amazonhpc -- Amazon HPC cluster environment StarCluster

This project allows the user to easy install and start a HPC cluster on Amazon’s Elastic Compute Cloud (EC2).

##Requirements
- Amazon AWS account https://console.aws.amazon.com/

##Each node are equipped with:

StarCluster Ubuntu 12.04 AMI
Software Tools for Academics and Researchers (STAR)
Homepage: http://star.mit.edu/cluster
Documentation: http://star.mit.edu/cluster/docs/latest
Code: https://github.com/jtriley/StarCluster
Mailing list: starcluster@mit.edu

This AMI Contains:

  * NVIDIA Driver 313.26
  * NVIDIA CUDA Toolkit 5.0, V0.2.1221
  * PyCuda/PyOpenCL 2012.1
  * MAGMA 1.3.0
  * Open Grid Scheduler (OGS - formerly SGE) queuing system
  * Condor workload management system
  * OpenMPI compiled with Open Grid Scheduler support
  * OpenBLAS - Highly optimized Basic Linear Algebra Routines
  * NumPy/SciPy linked against OpenBLAS
  * Julia linked against OpenBLAS
  * IPython 0.13 with parallel support
  * and more! (use 'dpkg -l' to show all installed packages)

Open Grid Scheduler/Condor cheat sheet:

  * qstat/condor_q - show status of batch jobs
  * qhost/condor_status- show status of hosts, queues, and jobs
  * qsub/condor_submit - submit batch jobs (e.g. qsub -cwd ./job.sh)
  * qdel/condor_rm - delete batch jobs (e.g. qdel 7)
  * qconf - configure Open Grid Scheduler system
