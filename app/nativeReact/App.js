import Route from "./Router/Route";
import AuthUserProvider from "./Contexts/auth";

export default function App() {
  return (
      <AuthUserProvider>
          <Route/>
      </AuthUserProvider>
  );
}
