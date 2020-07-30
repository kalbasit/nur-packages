{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "swm";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "kalbasit";
    repo = "swm";
    rev = "v${version}";
    sha256 = "1f72sgh4l76s5n9ah26b5716j2qjprii5g7svhs0gmf106277air";
  };

  modSha256 = "1hx16v44bvjxrb6m0m065ac9igv8vh8rj1mhzsiyxnnipkcgm0p0";

  buildFlagsArray = [ "-ldflags=" "-X=main.version=${version}" ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/kalbasit/swm";
    description = "swm (Story-based Workflow Manager) is a Tmux session manager specifically designed for Story-based development workflow";
    license = licenses.mit;
    maintainers = [ maintainers.kalbasit ];
  };
}
