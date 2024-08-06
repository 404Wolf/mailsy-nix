{
  buildNpmPackage,
  fetchFromGitHub,
  lib,
}:
buildNpmPackage rec {
  pname = "mailsy";
  version = "5.0.0";

  src = fetchFromGitHub {
    owner = "BalliAsghar";
    repo = "Mailsy";
    rev = version;
    hash = "sha256-RnOWvu023SOcN83xEEkYFwgDasOmkMwSzJ/QYjvTBDo=";
  };

  npmDepsHash = "sha256-ljmqNmLvRHPdsKyOdDfECBXHTIExM6nPZF45lqV+pDM=";

  npmFlags = ["--legacy-peer-deps"];

  dontNpmBuild = true;

  patches = [./fix-file-lookup.patch];

  meta = with lib; {
    description = "Check for outdated, incorrect, and unused dependencies";
    mainProgram = "npm-check";
    homepage = "https://github.com/dylang/npm-check";
    changelog = "https://github.com/dylang/npm-check/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = [maintainers.thomasjm];
  };
}
