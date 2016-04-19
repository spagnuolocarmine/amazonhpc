# amazonhpc -- Amazon HPC cluster environment StarCluster

This project allows the user to easy install and start a HPC cluster on Amazon’s Elastic Compute Cloud (EC2).

##Requirements
- Amazon AWS account (https://console.aws.amazon.com/)
- Second user Amazon AWS with AmazonEC2FullAccess

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


###Basic Test installation

    #include <mpi.h>
    #include <stdio.h>
    
    int main(int argc, char** argv) {
        // Initialize the MPI environment
        MPI_Init(NULL, NULL);
    
        // Get the number of processes
        int world_size;
        MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    
        // Get the rank of the process
        int world_rank;
        MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    
        // Get the name of the processor
        char processor_name[MPI_MAX_PROCESSOR_NAME];
        int name_len;
        MPI_Get_processor_name(processor_name, &name_len);
    
        // Print off a hello world message
        printf("Hello world from processor %s, rank %d"
               " out of %d processors\n",
               processor_name, world_rank, world_size);
    
        // Finalize the MPI environment.
        MPI_Finalize();
    }
