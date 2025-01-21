// sample.cpp

#include <qp_solver_collection/QpSolverCollection.h>

int main()
{
  int dim_var = 2;
  int dim_eq = 1;
  int dim_ineq = 0;
  QpSolverCollection::QpCoeff qp_coeff;
  qp_coeff.setup(dim_var, dim_eq, dim_ineq);
  qp_coeff.obj_mat_ << 2.0, 0.5, 0.5, 1.0;
  qp_coeff.obj_vec_ << 1.0, 1.0;
  qp_coeff.eq_mat_ << 1.0, 1.0;
  qp_coeff.eq_vec_ << 1.0;
  qp_coeff.x_min_.setZero();
  qp_coeff.x_max_.setConstant(1000.0);

  auto qp_solver = QpSolverCollection::allocateQpSolver(QpSolverCollection::QpSolverType::Any);
  Eigen::VectorXd solution = qp_solver->solve(qp_coeff);
  std::cout << "solution: " << solution.transpose() << std::endl;

  return 0;
}